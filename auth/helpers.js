generateToken = function (username) {
  // Gerando um token JWT mockado baseado no nome de usuário
  return 'mocked-jwt-token-' + username;
}

validateToken = function (authHeader) {
  // Verifica se o token é válido
  if (!authHeader) {
    return false;
  }
  var token = authHeader.split(' ')[1];
  return token && token.startsWith('mocked-jwt-token-');
}

getUserFromToken = function (token) {
  // Extrai o usuário do token mockado (apenas um exemplo simples)
  var username = token.replace('mocked-jwt-token-', '');
  return { id: 1, name: username, roles: ['USER'] };
}
