from typing import List, Tuple


def max_concurrent_time(intervals: List[List[int]]) -> Tuple[int, int]:
    """
    Return (earliest_time, max_count) where max_count is the maximum number of
    active intervals at any time, and earliest_time is the earliest time achieving it.

    Intervals are inclusive: [start, end] means active at both start and end.
    """
    events = []
    for s, e in intervals:
        events.append((s, +1))  # start adds one active session
        events.append((e + 1, -1))  # because inclusive, end+1 removes it

    # Sort by time; for same time, apply additions before removals is not required here
    # because we used end+1 trick, so same-time collisions are handled cleanly.
    events.sort()

    cur = 0
    best = 0
    best_time = None

    i = 0
    n = len(events)
    while i < n:
        t = events[i][0]
        # apply all deltas at time t
        delta = 0
        while i < n and events[i][0] == t:
            delta += events[i][1]
            i += 1

        cur += delta

        # After applying deltas at time t, cur represents active sessions during time t (and until next event time).
        # Since times are discrete seconds but can be huge, we only care about event points.
        if cur > best:
            best = cur
            best_time = t

    return best_time, best


if __name__ == "__main__":
    tests = [
        ([[1, 4], [2, 4], [4, 6], [5, 5]], (4, 3)),
        ([[10, 10], [10, 12], [13, 15]], (10, 2)),
        ([[0, 2], [1, 3], [2, 4]], (2, 3)),
    ]

    for intervals, expected in tests:
        ans = max_concurrent_time(intervals)
        print(f"intervals={intervals} -> {ans} (expected {expected})")
