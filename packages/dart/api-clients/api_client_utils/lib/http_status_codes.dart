const String httpStatusMessageSource =
    'https://www.rfc-editor.org/rfc/rfc9110.html';
const Map<int, String> messageFor = {
  400:
      'The 400 (Bad Request) status code indicates that the server cannot or will not process the request due to something that is perceived to be a client error (e.g., malformed request syntax, invalid request message framing, or deceptive request routing).',
  401:
      'The 401 (Unauthorized) status code indicates that the request has not been applied because it lacks valid authentication credentials for the target resource.',
  403:
      'The 403 (Forbidden) status code indicates that the server understood the request but refuses to fulfill it.',
  404:
      'The 404 (Not Found) status code indicates that the origin server did not find a current representation for the target resource or is not willing to disclose that one exists.',
  405:
      'The 405 (Method Not Allowed) status code indicates that the method received in the request-line is known by the origin server but not supported by the target resource.',
  406:
      'The 406 (Not Acceptable) status code indicates that the target resource does not have a current representation that would be acceptable to the user agent, according to the proactive negotiation header fields received in the request, and the server is unwilling to supply a default representation.',
  407:
      'The 407 (Proxy Authentication Required) status code is similar to 401 (Unauthorized), but it indicates that the client needs to authenticate itself in order to use a proxy for this request.',
  408:
      'The 408 (Request Timeout) status code indicates that the server did not receive a complete request message within the time that it was prepared to wait.',
  409:
      'The 409 (Conflict) status code indicates that the request could not be completed due to a conflict with the current state of the target resource.',
  410:
      'The 410 (Gone) status code indicates that access to the target resource is no longer available at the origin server and that this condition is likely to be permanent.',
};
