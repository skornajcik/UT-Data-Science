

```python
import numpy as np
import pandas as pd
```


```python
#import school data
csv_path = "raw_data/schools_complete.csv"
school_df = pd.read_csv(csv_path)
school_df = school_df.rename(columns = {"name":"school"})
school_df
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>School ID</th>
      <th>school</th>
      <th>type</th>
      <th>size</th>
      <th>budget</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Huang High School</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Figueroa High School</td>
      <td>District</td>
      <td>2949</td>
      <td>1884411</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Shelton High School</td>
      <td>Charter</td>
      <td>1761</td>
      <td>1056600</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Hernandez High School</td>
      <td>District</td>
      <td>4635</td>
      <td>3022020</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Griffin High School</td>
      <td>Charter</td>
      <td>1468</td>
      <td>917500</td>
    </tr>
    <tr>
      <th>5</th>
      <td>5</td>
      <td>Wilson High School</td>
      <td>Charter</td>
      <td>2283</td>
      <td>1319574</td>
    </tr>
    <tr>
      <th>6</th>
      <td>6</td>
      <td>Cabrera High School</td>
      <td>Charter</td>
      <td>1858</td>
      <td>1081356</td>
    </tr>
    <tr>
      <th>7</th>
      <td>7</td>
      <td>Bailey High School</td>
      <td>District</td>
      <td>4976</td>
      <td>3124928</td>
    </tr>
    <tr>
      <th>8</th>
      <td>8</td>
      <td>Holden High School</td>
      <td>Charter</td>
      <td>427</td>
      <td>248087</td>
    </tr>
    <tr>
      <th>9</th>
      <td>9</td>
      <td>Pena High School</td>
      <td>Charter</td>
      <td>962</td>
      <td>585858</td>
    </tr>
    <tr>
      <th>10</th>
      <td>10</td>
      <td>Wright High School</td>
      <td>Charter</td>
      <td>1800</td>
      <td>1049400</td>
    </tr>
    <tr>
      <th>11</th>
      <td>11</td>
      <td>Rodriguez High School</td>
      <td>District</td>
      <td>3999</td>
      <td>2547363</td>
    </tr>
    <tr>
      <th>12</th>
      <td>12</td>
      <td>Johnson High School</td>
      <td>District</td>
      <td>4761</td>
      <td>3094650</td>
    </tr>
    <tr>
      <th>13</th>
      <td>13</td>
      <td>Ford High School</td>
      <td>District</td>
      <td>2739</td>
      <td>1763916</td>
    </tr>
    <tr>
      <th>14</th>
      <td>14</td>
      <td>Thomas High School</td>
      <td>Charter</td>
      <td>1635</td>
      <td>1043130</td>
    </tr>
  </tbody>
</table>
</div>




```python
#import student data
csv_path = "raw_data/students_complete.csv"
student_df = pd.read_csv(csv_path)
student_df.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Student ID</th>
      <th>name</th>
      <th>gender</th>
      <th>grade</th>
      <th>school</th>
      <th>reading_score</th>
      <th>math_score</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Paul Bradley</td>
      <td>M</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>66</td>
      <td>79</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Victor Smith</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>94</td>
      <td>61</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Kevin Rodriguez</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>90</td>
      <td>60</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Dr. Richard Scott</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>67</td>
      <td>58</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bonnie Ray</td>
      <td>F</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>97</td>
      <td>84</td>
    </tr>
  </tbody>
</table>
</div>




```python
school_count = school_df["School ID"].count()

student_sum = school_df["size"].sum()

tot_budget = school_df["budget"].sum()

avg_math_score = student_df["math_score"].mean()
avg_math_score
avg_reading_score = student_df["reading_score"].mean()
avg_reading_score
```




    81.87784018381414




```python
# percent passing math
reading_scores = student_df['reading_score']
student_pass_reading = reading_scores[reading_scores > 70]
num_pass_read = student_pass_reading.count()
avg_num_pass_read = (num_pass_read / student_df["reading_score"].count())* 100
avg_num_pass_read
# percent passing reading
math_scores = student_df['math_score']
student_pass_math = math_scores[math_scores > 70]
num_pass_math = student_pass_math.count()
avg_num_pass_math = (num_pass_math / student_df["math_score"].count())* 100
avg_num_pass_math
#both
reading_math_scores = student_df[['reading_score' , 'math_score']]
reading_math_scores_pass = reading_math_scores[reading_math_scores > 70]
clean_reading_math_scores_pass = reading_math_scores_pass.dropna(how='any')
avg_num_pass_overall = clean_reading_math_scores_pass["reading_score"].count() / student_df["reading_score"].count()* 100
avg_num_pass_overall
```




    60.801633903497574




```python
#District Summary
district_sum_df = pd.DataFrame({'Total Schools' : [school_count] ,
                                'Total Students' : [student_sum] ,
                                'Total Budget' : [tot_budget], 
                                'Average Math Score' : [avg_math_score], 
                                'Average Reading Score' : [avg_reading_score], 
                                '% Passing Math' : [avg_num_pass_math],
                                '% Passing Reading' : [avg_num_pass_read],
                                '% Overall Passing Rate' : [avg_num_pass_overall]}) 
district_sum_df = district_sum_df[["Total Schools", "Total Students",
                                'Total Budget' , 
                                'Average Math Score', 
                                'Average Reading Score' , 
                                '% Passing Math' ,
                                '% Passing Reading' ,
                                '% Overall Passing Rate',
                                '% Overall Passing Rate' ]]
district_sum_df
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Total Schools</th>
      <th>Total Students</th>
      <th>Total Budget</th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>% Passing Math</th>
      <th>% Passing Reading</th>
      <th>% Overall Passing Rate</th>
      <th>% Overall Passing Rate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>15</td>
      <td>39170</td>
      <td>24649428</td>
      <td>78.985371</td>
      <td>81.87784</td>
      <td>72.392137</td>
      <td>82.971662</td>
      <td>60.801634</td>
      <td>60.801634</td>
    </tr>
  </tbody>
</table>
</div>




```python
merged_school = pd.merge(student_df, school_df , on ="school")
merged_school.head()
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Student ID</th>
      <th>name</th>
      <th>gender</th>
      <th>grade</th>
      <th>school</th>
      <th>reading_score</th>
      <th>math_score</th>
      <th>School ID</th>
      <th>type</th>
      <th>size</th>
      <th>budget</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>0</td>
      <td>Paul Bradley</td>
      <td>M</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>66</td>
      <td>79</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
    <tr>
      <th>1</th>
      <td>1</td>
      <td>Victor Smith</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>94</td>
      <td>61</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
    <tr>
      <th>2</th>
      <td>2</td>
      <td>Kevin Rodriguez</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>90</td>
      <td>60</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
    <tr>
      <th>3</th>
      <td>3</td>
      <td>Dr. Richard Scott</td>
      <td>M</td>
      <td>12th</td>
      <td>Huang High School</td>
      <td>67</td>
      <td>58</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
    <tr>
      <th>4</th>
      <td>4</td>
      <td>Bonnie Ray</td>
      <td>F</td>
      <td>9th</td>
      <td>Huang High School</td>
      <td>97</td>
      <td>84</td>
      <td>0</td>
      <td>District</td>
      <td>2917</td>
      <td>1910635</td>
    </tr>
  </tbody>
</table>
</div>




```python

school_name_grouped = merged_school.groupby("school")
student_per_school = school_name_grouped["size"].sum()
budget_per_school = school_name_grouped["budget"]
#Price_per_student = budget_per_school / student_per_school
avg_math_school = school_name_grouped["math_score"].mean()
avg_reading_school = school_name_grouped["reading_score"].mean()
#math_reading_scores = school_name_grouped["math_score","reading_score"]
#Passing_math_reading = math_reading_scores[math_reading_scores > 70]
school_types = school_df.set_index(["school"])["type"]
```


```python
total_students_per_school = school_name_grouped["school"].value_counts()
#total_budget_per_school = school_name_grouped.groupby(["school"]).mean()["budget"]
#budget_per_student = total_budget_per_school / total_students_per_school
#budget_per_student
```


```python
school_name_df = pd.DataFrame({"Total Students":student_per_school, 
                               "Average Math Score" :avg_math_school,
                               "Average Reading Score" : avg_reading_school, 
                               "Type": school_types})
school_name_df
```




<div>
<style>
    .dataframe thead tr:only-child th {
        text-align: right;
    }

    .dataframe thead th {
        text-align: left;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }
</style>
<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>Average Math Score</th>
      <th>Average Reading Score</th>
      <th>Total Students</th>
      <th>Type</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>Bailey High School</th>
      <td>77.048432</td>
      <td>81.033963</td>
      <td>24760576</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Cabrera High School</th>
      <td>83.061895</td>
      <td>83.975780</td>
      <td>3452164</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Figueroa High School</th>
      <td>76.711767</td>
      <td>81.158020</td>
      <td>8696601</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Ford High School</th>
      <td>77.102592</td>
      <td>80.746258</td>
      <td>7502121</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Griffin High School</th>
      <td>83.351499</td>
      <td>83.816757</td>
      <td>2155024</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Hernandez High School</th>
      <td>77.289752</td>
      <td>80.934412</td>
      <td>21483225</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Holden High School</th>
      <td>83.803279</td>
      <td>83.814988</td>
      <td>182329</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Huang High School</th>
      <td>76.629414</td>
      <td>81.182722</td>
      <td>8508889</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Johnson High School</th>
      <td>77.072464</td>
      <td>80.966394</td>
      <td>22667121</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Pena High School</th>
      <td>83.839917</td>
      <td>84.044699</td>
      <td>925444</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Rodriguez High School</th>
      <td>76.842711</td>
      <td>80.744686</td>
      <td>15992001</td>
      <td>District</td>
    </tr>
    <tr>
      <th>Shelton High School</th>
      <td>83.359455</td>
      <td>83.725724</td>
      <td>3101121</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Thomas High School</th>
      <td>83.418349</td>
      <td>83.848930</td>
      <td>2673225</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Wilson High School</th>
      <td>83.274201</td>
      <td>83.989488</td>
      <td>5212089</td>
      <td>Charter</td>
    </tr>
    <tr>
      <th>Wright High School</th>
      <td>83.682222</td>
      <td>83.955000</td>
      <td>3240000</td>
      <td>Charter</td>
    </tr>
  </tbody>
</table>
</div>




```python
#math_score_9 = school_name_grouped.apply[school_name_grouped["grade"] == "9th", :]
```


    ---------------------------------------------------------------------------

    TypeError                                 Traceback (most recent call last)

    <ipython-input-221-47956d458d4d> in <module>()
    ----> 1 math_score_9 = school_name_grouped.apply[school_name_grouped["grade"] == "9th", :]
    

    TypeError: 'method' object is not subscriptable

