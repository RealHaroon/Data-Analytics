# import base64
# import json
# import pandas as pd
# ser=pd.Series(["Haroon",38,True])
# print(ser)
# df=pd.DataFrame({
#     "Name":["Haroon","Abbas","Khan"],
#     "Age":[20,19,19]
# })
# print(df)
# print(type(df))
# print("Testing git on linux mint")

# df.rename(columns={"Age":"age"},inplace=True)
# print(df)

# list unpacking 
numbers = [1, 2, 3, 4, 5, 6]

first, *second, others = numbers

print(first)   # 1
print(second)  # 2
print(others)  # [3, 4, 5, 6] -> All the rest go here!

