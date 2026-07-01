SET search_path TO polvinho;

CREATE TABLE IF NOT EXISTS schema_migrations (
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	version VARCHAR(255) UNIQUE NOT NULL,
	name_migration VARCHAR(255) NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);