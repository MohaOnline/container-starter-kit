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

  // 
  const myIP4 = await lookupPromise();
  console.log("My IP4 is: %s", myIP4);

  const postgresPath = path.resolve(__dirname, "../postgres-11/postgres");
  const pgContainer = await new GenericContainer("postgres", "11")
    .withName("postgres-11")
    .withExposedPorts(5432)
    .withEnv("POSTGRES_USER", "root")
    .withEnv("POSTGRES_PASSWORD", "root")
    .withBindMount(postgresPath, "/var/lib/postgresql/data")
    .start();

})();
