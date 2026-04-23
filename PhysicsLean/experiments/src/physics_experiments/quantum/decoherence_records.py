from __future__ import annotations


def record_is_decoherent(record: list[str]) -> bool:
    return len(record) == len(set(record))


def stable_records(records: list[list[str]]) -> list[list[str]]:
    return [record for record in records if record_is_decoherent(record)]