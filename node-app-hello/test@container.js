// 容器准备 JS
// Usage: node container.js
// 意外退出考虑手动清除容器 docker rm -f postgres-11 node-app-hello
const request = require('request');
const path = require('path');
const dns = require('dns');
const os = require('os');
const {
  GenericContainer
} = require('testcontainers');

(async () => {

  async function lookupPromise() {
    return new Promise((resolve, reject) => {
      dns.lookup(os.hostname(), (err, address, family) => {
        if (err) throw reject(err);
        resolve(address);
      });
    });
  };

  function logError(message) {
    console.log('\x1b[31m%s\x1b[0m', `***ERR: ${message}`);
  }

  // 
  const hostIP4 = await lookupPromise();
  console.log("Host IP4 is: %s", hostIP4);

  // 启动 PostgreSQL
  const pgDataPath = path.resolve(__dirname, "../postgres-11/postgres");
  const pgContainer = await new GenericContainer("postgres", "11")
    .withName("postgres-11")
    .withExposedPorts(5432)
    .withEnv("POSTGRES_USER", "root")
    .withEnv("POSTGRES_PASSWORD", "root")
    .withBindMount(pgDataPath, "/var/lib/postgresql/data")
    .start();
  const pgPort = pgContainer.getMappedPort(5432);
  console.log("Postgres listening: %d", pgPort);

  // 现编镜像启动 node-app-hello 容器
  const imagePath = path.resolve(__dirname);
  const image = await GenericContainer
    .fromDockerfile(imagePath)
    .build();
  const container = await image
    .withName("node-app-hello")
    .withExposedPorts(3000)
    .withEnv("DB_HOST", hostIP4)
    .withEnv("DB_PORT", pgPort)
    .start();
  const appPort = container.getMappedPort(3000);
  console.log("node-app-hello listening: %d", appPort);

  // 手动验证/测试
  const base_url = `http://localhost:${appPort}`
  console.log("App URL: %s", base_url);
  request.get(base_url + "/pg", (error, response, body) => {
    console.log("> expecting status code 200");
    if (response.statusCode != 200) {
      logError(`Unexpected status code ${response.statusCode}`);
    }
    else {
      logError(`HTTP code: ${response.statusCode}`);
    }

    (async () => {
      await container.stop();
      await pgContainer.stop()
    })();
  });

})();
