library(tidyverse)

# 1. Data Set
unzip("student.zip")
student_math <- read.csv("student-mat.csv", sep = ";")

# 2. Organization and Letter Grades
clean_math <- student_math %>%
  select(studytime, absences, G3) %>%
  mutate(
    letter_grade = case_when(
      G3 >= 18 ~ "A+",
      G3 >= 14 ~ "B/A",
      G3 >= 10 ~ "C",
      TRUE     ~ "F"
    )
  )

# 3. View
View(clean_math)

# 4. Plotting

# Scatter Plot: Study Time vs. Final Grade
plot(
  G3 ~ studytime, 
  data = clean_math,
  main = "Weekly Study Time vs. Final Grade",
  xlab = "Study Time Category",
  ylab = "Final Grade (G3)",
  pch = 19,
  col = "blue"
)

# Boxplot: Final Grade by Study Time Category
boxplot(
  G3 ~ studytime, 
  data = clean_math,
  main = "Final Grade by Weekly Study Time",
  xlab = "Study Time Category (1: <2h, 2: 2-5h, 3: 5-10h, 4: >10h)",
  ylab = "Final Grade (G3)",
  col = "lightblue",
  border = "darkblue"
)

# Scatter Plot: Absences vs. Final Grade
plot(
  G3 ~ absences, 
  data = clean_math,
  main = "Impact of Absences on Final Grade",
  xlab = "Number of Absences",
  ylab = "Final Grade (G3)",
  pch = 19,
  col = rgb(0.2, 0.4, 0.8, 0.5)
)
