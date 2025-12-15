const http = require('http');

// URL to test (service name from docker-compose)
const url = "http://web:80";

http.get(url, (resp) => {
  let data = "";

  resp.on("data", (chunk) => {
    data += chunk;
  });

  resp.on("end", () => {
    // Print the raw response for debugging
    console.log("Raw response:", JSON.stringify(data));

    // Remove whitespace and check if it contains "Hello world"
    if (data.replace(/\s/g, '').includes("Helloworld")) {
      console.log("TEST PASSED");
      process.exit(0); // Success
    } else {
      console.error("TEST FAILED. Got:", JSON.stringify(data));
      process.exit(1); // Failure
    }
  });

}).on("error", (err) => {
  console.error("HTTP request failed:", err);
  process.exit(1);
});

