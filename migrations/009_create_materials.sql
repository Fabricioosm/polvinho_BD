SET search_path TO polvinho;

CREATE TABLE materials(
	id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
	id_subject UUID REFERENCES subjects(id) NOT NULL,
	created_by UUID REFERENCES users(id) NOT NULL,
	title VARCHAR(100) NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO schema_migrations (version, name_migration) VALUES ('009', 'create_materials') ON CONFLICT (version) DO NOTHING;