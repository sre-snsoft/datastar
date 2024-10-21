ALTER TABLE signoz_traces.signoz_error_index_v2 ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
ALTER TABLE signoz_traces.signoz_spans ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
ALTER TABLE signoz_traces.signoz_index_v2 ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
ALTER TABLE signoz_traces.durationSort ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
ALTER TABLE signoz_traces.dependency_graph_minutes_v2 ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
ALTER TABLE signoz_traces.usage_explorer ON CLUSTER cluster MODIFY TTL toDateTime(timestamp) + INTERVAL 90000 SECOND DELETE SETTINGS distributed_ddl_task_timeout = -1;
