from circle_area import circle_area

try:
    radius = float(input("円の半径を入力してください: "))
    area = circle_area(radius)
    print(f"円の面積は{area:.2f}cm²です")
except ValueError:
    print("円の半径は数値で入力してください")
