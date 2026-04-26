import Fastify from 'fastify';

const port = parseInt(process.env.PORT || '50033', 10);
const app = Fastify({ logger: { level: process.env.LOG_LEVEL || 'info' } });

app.get('/healthz', async () => ({
  status: 'ok',
  service: 'buddy-service',
  checked_at: new Date().toISOString(),
}));

app
  .listen({ host: '0.0.0.0', port })
  .then(() => app.log.info({ port }, 'buddy-service ready'))
  .catch(err => {
    app.log.error(err);
    process.exit(1);
  });
