INSERT INTO dict_type(create_at, create_by, type_name, update_at, update_by, field_name) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '对标指数', extract(epoch from now()) * 1000, 'admin|0', 'exponent_index');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '0', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '沪深300(000300)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '1', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '中证500（深市）(399905)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '2', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '中证1000(000852)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '3', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '上证50(000016)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '4', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '上证指数(000001)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '5', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '深证100(399004)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '6', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '中小版指数(399005)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '7', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '创业板指数(399006)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '8', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '科创板指数(883983)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '9', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '深证成指(399001)');

INSERT INTO dict(create_at, create_by, key, status, type, update_at, update_by, value) VALUES
(extract(epoch from now()) * 1000, 'admin|0', '10', 0, '对标指数', extract(epoch from now()) * 1000, 'admin|0', '中证500（沪市）(000905)');

DO $$
	BEGIN
		BEGIN
			alter table prod_ext add column index VARCHAR(255);
			COMMENT ON COLUMN "prod_ext".index IS '对标指数';
		EXCEPTION
			WHEN duplicate_column THEN RAISE NOTICE 'column index already exists in prod_ext';
		END;
	END;
$$;

-- 初始化

update prod_ext set index = '2' where id in (select id from basicproduct where chiname like '%中证1000%' and ( (secutype >=7000 and secutype< 8000) or (secutype >=1001 and secutype< 6000) ) );

update prod_ext set index = '10' where id in (select id from basicproduct where chiname like '%中证500%' and ( (secutype >=7000 and secutype< 8000) or (secutype >=1001 and secutype< 6000) ) );

update prod_ext set index = '0' where id in (select id from basicproduct where chiname like '%沪深300%' and ( (secutype >=7000 and secutype< 8000) or (secutype >=1001 and secutype< 6000) ) );