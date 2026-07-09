SET search_path TO polvinho;

ALTER TABLE attachments DROP COLUMN attachment_type, DROP COLUMN external_link, DROP COLUMN created_by;

ALTER TABLE attachments RENAME COLUMN file_extension TO attachable_extension;

DROP TYPE IF EXISTS enum_type_attachment;

INSERT INTO schema_migrations (version, name_migration) VALUES ('022','DROP_attachment_type_external_link_created_by_and_RENAME_file_extension') ON CONFLICT (version) DO NOTHING;

