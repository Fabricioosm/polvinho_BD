DROP TABLE polvinho.users_submissions;

INSERT INTO polvinho.schema_migrations (version, name_migration) VALUES ('024', 'drop_users_submissions') ON CONFLICT (version) DO NOTHING;