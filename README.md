# Hoon Hotel's Management Database

This repository contains the database schema for a **Hoon Hotel's management system**, designed to support:
- room inventory
- customer bookings
- booking history & auditing
- reporting and dashboard use cases
- future automation and AI-driven actions

The schema is intentionally split into logical layers to reflect real-world system design.

---

## Schema Overview

| Schema | Purpose |
|------|--------|
| `hh_md` | Master data (room types, rooms, customers) |
| `hh_bd` | Business / transactional data (bookings, booking audit logs) |
| `hh_rpt` | Reporting views (read-only, dashboard-friendly) |

---

## Core Entities

### Master Data (`hh_md`)
- **ROOM_TYPES** – Defines room categories and amenities
- **ROOMS** – Physical rooms (level + room number)
- **CUSTOMERS** – Guest and booker information

### Business Data (`hh_bd`)
- **BOOKINGS** – Time-bound room reservations
- **BOOKING_AUDIT** – Append-only audit trail of booking changes

---

## Entity Relationship Diagram

The diagram below shows the core tables and their relationships.

```mermaid
erDiagram

    ROOM_TYPES {
        INT room_code PK
        VARCHAR name
        VARCHAR description
        INT single_bed_count
        INT twin_bed_count
        INT queen_bed_count
        BIT has_toilet
        BIT has_shower
        BIT has_bathtub
        BIT has_tv
        VARCHAR tv_type
        VARCHAR wifi_type
        BIT has_aircon
        BIT has_minibar
        BIT has_safe
    }

    ROOMS {
        INT level_number PK
        INT room_number PK
        INT room_code FK
        BIT is_booked
        INT security_type_code
    }

    CUSTOMERS {
        INT customer_id PK
        VARCHAR first_name
        VARCHAR last_name
        VARCHAR nationality
        VARCHAR email
        VARCHAR phone
        DATETIME2 created_at
    }

    BOOKINGS {
        INT booking_id PK
        INT customer_id FK
        INT level_number FK
        INT room_number FK
        VARCHAR booking_status
        DATE check_in_date
        DATE check_out_date
        DATETIME2 created_at
        DATETIME2 updated_at
    }

    BOOKING_AUDIT {
        INT audit_id PK
        INT booking_id FK
        VARCHAR field_name
        VARCHAR old_value
        VARCHAR new_value
        VARCHAR changed_by
        VARCHAR change_reason
        DATETIME2 changed_at
    }

    ROOM_TYPES ||--o{ ROOMS : "defines"
    ROOMS ||--o{ BOOKINGS : "assigned to"
    CUSTOMERS ||--o{ BOOKINGS : "makes"
    BOOKINGS ||--o{ BOOKING_AUDIT : "has changes"
