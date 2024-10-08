Feature: Mock server for login, logout, and auth flow with helpers

Background:
    * def loginResponse = { token: 'mocked-jwt-token', user: { id: 1, name: 'John Doe', roles: ['USER'] } }
    * def errorResponse = { message: 'Unauthorized' }

Scenario: pathMatches('/api/v1/auth/login') && methodIs('POST')
    * def loginMock = 
    """
    function(username, password) {
        if (username == 'dummy-user' && password == 'dummy-pass') {
            return { status: 200, body: loginResponse };
        }
        return { status: 401, body: errorResponse };
    }
    """

    * def username = requestParams['user']
    * def password = requestParams['password']

    * def response = loginMock(username, password)

Scenario: pathMatches('/api/v1/auth/logout') && methodIs('POST')
    * def logoutMock = 
    """
    function() {
        return { status: 200, body: { message: 'Logged out successfully' } };
    }
    """

    * def response = logoutMock()

Scenario: pathMatches('/api/v1/auth') && methodIs('GET')
    * def authMock = 
    """
    function(token) {
        if (!token || token != 'Bearer mocked-jwt-token') {
            return { status: 401, body: { message: 'Unauthorized' } };
        }
        return { status: 200, body: { message: 'Authorized' } };
    }
    """

    * def token = requestHeaders['authorization']

    * def response = authMock(token)
  
