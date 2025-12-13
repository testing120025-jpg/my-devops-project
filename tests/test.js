const http = require("http");

http.get("http://web:80", (resp) => {
  let data = "";

  resp.on("data", (chunk) => {
    data += chunk;
  });

  resp.on("end", () => {
    if (data.trim() === "Hello world") {
      console.log("TEST PASSED");
      process.exit(0);
    } else {
      console.error("TEST FAILED. Got:", data);
      process.exit(1);
    }
  });

  resp.on("error", (err) => {
    console.error("Request failed with error:", err);
    process.exit(1);
  });

}).on("error", (err) => {
  console.error("HTTP request failed:", err);
  process.exit(1);
});

