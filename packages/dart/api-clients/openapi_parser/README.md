# openapi_parser

*Parses an OpenAPI description to generate a Dart client for the described API.*

## Compatible Versions

The parser complies with [OpenAPI Specification Version 3.1.0](https://www.notion.so/reference-material/OpenAPI-Specification-Version-3-1-0-8658986fa27c4995aedc41ac45faf65b)

* 3.0.x : Should be fine, potentially a very small migration may be needed, see: [Migrating from OpenAPI 3.0 to 3.1.0 - OpenAPI Initiative](https://www.openapis.org/blog/2021/02/16/migrating-from-openapi-3-0-to-3-1-0)
* 2.y.z : unfortunately below 3.0.0 will not work, you could try:
  * migrating to 3.1.0, see:
    * [https://stackoverflow.com/questions/59749513/how-to-convert-openapi-2-0-to-openapi-3-0](https://stackoverflow.com/questions/59749513/how-to-convert-openapi-2-0-to-openapi-3-0)
    * [Migration from Swagger 2 to OpenAPI 3 | by Erwan LE TUTOUR | Javarevisited | Medium](https://medium.com/javarevisited/migration-from-swagger-2-to-openapi-3-391f3e97da73)
  * Or, depending on how daunting a task that looks, maybe look for a tool that supports OpenAPI version 2 at [OpenAPI.Tools](https://openapi.tools/) or [pub.dev](https://pub.dev/)
