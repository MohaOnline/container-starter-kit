// 测试用例文件名需以 spec / Spec 结尾

var request = require("request");

const base_url = process.env.BASE_URL || 'http://localhost:3000';

describe("API test suite", () => {
  describe("GET /", () => {
    
    it("returns status code 200", function (done) {
      request.get(base_url, (error, response, body) => {
        expect(response.statusCode).toBe(200);
        done();
      });
    });

    it("returns description", () => {
      request.get(base_url, (error, response, body) => {
        expect(body).toContain("Root Response");
        done();
      });
    });

  });
});
