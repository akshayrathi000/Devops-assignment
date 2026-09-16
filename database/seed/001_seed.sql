-- ============================================================
-- Seed hotel bookings
-- ============================================================

INSERT INTO hotel_bookings (
    org_id,
    hotel_id,
    city,
    checkin_date,
    checkout_date,
    amount,
    status,
    created_at
)
SELECT
    (
        ARRAY[
            '11111111-1111-1111-1111-111111111111'::uuid,
            '22222222-2222-2222-2222-222222222222'::uuid,
            '33333333-3333-3333-3333-333333333333'::uuid,
            '44444444-4444-4444-4444-444444444444'::uuid
        ]
    )[1 + floor(random() * 4)::int] AS org_id,

    'HOTEL-' || (1 + floor(random() * 20))::int AS hotel_id,

    (
        ARRAY[
            'delhi',
            'mumbai',
            'bangalore',
            'pune',
            'hyderabad'
        ]
    )[1 + floor(random() * 5)::int] AS city,

    CURRENT_DATE + floor(random() * 30)::int AS checkin_date,

    CURRENT_DATE + 30 + floor(random() * 30)::int AS checkout_date,

    round((1000 + random() * 49000)::numeric, 2) AS amount,

    (
        ARRAY[
            'confirmed',
            'cancelled',
            'pending',
            'completed'
        ]
    )[1 + floor(random() * 4)::int] AS status,

    NOW() - (floor(random() * 60)::int || ' days')::interval AS created_at

FROM generate_series(1, 150);


-- ============================================================
-- Seed booking creation events
-- ============================================================

INSERT INTO booking_events (
    booking_id,
    event_type,
    payload,
    created_at
)
SELECT
    id,
    'booking_created',
    jsonb_build_object(
        'source', 'web',
        'channel', 'online'
    ),
    created_at
FROM hotel_bookings
WHERE random() < 0.60;


-- ============================================================
-- Seed booking status update events
-- ============================================================

INSERT INTO booking_events (
    booking_id,
    event_type,
    payload,
    created_at
)
SELECT
    id,
    'booking_status_updated',
    jsonb_build_object(
        'source', 'system',
        'updated_by', 'booking-service'
    ),
    created_at + INTERVAL '1 hour'
FROM hotel_bookings
WHERE status IN ('confirmed', 'completed')
  AND random() < 0.50;
