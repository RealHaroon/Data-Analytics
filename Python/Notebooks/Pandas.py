import base64
import json
import pandas as pd
ser=pd.Series(["Haroon",38,True])
print(ser)
df=pd.DataFrame({
    "Name":["Haroon","Abbas","Khan"],
    "Age":[20,19,19]
})
print(df)
print(type(df))
print("Testing git on linux mint")

df.rename(columns={"Age":"age"},inplace=True)
print(df)



