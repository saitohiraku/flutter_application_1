module.exports = ({ env }) => ({
  auth: {
    secret: env('ADMIN_JWT_SECRET', 'someDefaultSecret'),
  },
  apiToken: {
    salt: env('API_TOKEN_SALT'),
  },
});
