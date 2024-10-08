# Mock Server for Login, Logout, and Authentication Flow using Karate DSL

Este projeto demonstra a implementação de um servidor mock usando **Karate DSL** para lidar com fluxos de login, logout e autenticação. Ele fornece endpoints básicos de API para login, logout e autenticação baseada em token, utilizando funções auxiliares para simular as respostas.

# Pré-Requisitos

- Baixe o executável do Karate DSL na raiz: https://github.com/karatelabs/karate/releases/download/v1.5.0.RC3/karate-1.5.0.RC3.jar

## Endpoints

- **Login (`/api/v1/auth/login`)**: Valida o nome de usuário e a senha, retornando um token JWT simulado em caso de sucesso.
- **Logout (`/api/v1/auth/logout`)**: Realiza o logout do usuário e retorna uma mensagem de sucesso.
- **Autenticação (`/api/v1/auth`)**: Verifica o token JWT do cabeçalho da requisição para determinar se o usuário está autorizado.

## Como funciona

A feature possui três cenários que representam o comportamento esperado para login, logout e verificação de autenticação.

### 1. Login

- **Endpoint**: `/api/v1/auth/login`
- **Método**: `POST`
- **Descrição**: Verifica o nome de usuário e a senha fornecidos. Se forem válidos, retorna um token JWT simulado. Caso contrário, retorna um erro de `401 Unauthorized`.
- **Corpo da requisição**:
    ```json
    {
    "user": "dummy-user",
    "password": "dummy-pass"
    }
    ```
- **Resposta de sucesso (200 OK)**:
  ```json
  {
  "status": 200,
  "body": {
      "token": "mocked-jwt-token",
      "user": {
      "id": 1,
      "name": "John Doe",
      "roles": [
          "USER"
      ]
      }
  }
  }
  ```

- **Resposta de falha (401 Unauthorized)**:
  ```json
  {
    "status": 401,
    "body": {
      "message": "Unauthorized"
    }
  }
  ```

### 2. Logout
- **Endpoint**: `/api/v1/auth/logout`
- **Método**: `POST`
- **Descrição**: Simula o logout do usuário e retorna uma mensagem de sucesso.
- **Resposta de sucesso (200 OK)**:
  ```json
  {
    "message": "Logged out successfully"
  }
  ```

### 3. Verificação de Autenticação
- **Endpoint**: `/api/v1/auth`
- **Método**: `GET`
- **Descrição**: Verifica se o token JWT presente no cabeçalho da requisição é válido. Se o token for válido, retorna uma mensagem de autorização. Caso contrário, retorna um erro de `401 Unauthorized`.
- **Cabeçalho da requisição**:
  ```
  Authorization: Bearer mocked-jwt-token
  ```
- **Resposta de sucesso (200 OK)**:
  ```json
  {
    "message": "Authorized"
  }
  ```

- **Resposta de falha (401 Unauthorized)**:
  ```json
  {
    "message": "Unauthorized"
  }
  ```