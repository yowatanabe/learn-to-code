def ticket_process_order(tickets, target_index):
    target_priority = tickets[target_index]
    order = 1

    for i, priority in enumerate(tickets):
        if priority > target_priority:
            order += 1
        elif priority == target_priority and i < target_index:
            order += 1

    return order


# 実行例
tickets1 = [2, 1, 3, 2]
target_index1 = 0

tickets2 = [1, 1, 1]
target_index2 = 2

tickets3 = [5, 3, 5, 4]
target_index3 = 2

print(ticket_process_order(tickets1, target_index1))  # 2
print(ticket_process_order(tickets2, target_index2))  # 3
print(ticket_process_order(tickets3, target_index3))  # 2
