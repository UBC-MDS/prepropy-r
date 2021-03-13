df <- data.frame(num1 = c(8.5, 8, 9.2, 9.1, 9.4),
                       num2 = c(0.88, 0.93, 0.95 , 0.92 , 0.91),
                       num3 = c(0.46, 0.78, 0.66, 0.69, 0.52),
                       num4 = c(0.082, 0.078, 0.082, 0.085, 0.066),
                       cat1 = c("Good","Okay","Excellent","Terrible","Good"),
                       target = c(2,2,3,1,3))
ls <- c(1,2,3,4,5)

test_that('Plot should use gg matrix and the numerical column only', {
  p <- eda(df,"target")$pairplot
  expect_true("ggmatrix" %in% c(class(p)))
  expect_true(eda(df,"target")$nb_num_features == p$ncol)
})

test_that('Check attributes', {
  res <- eda(df,"target")
  expect_true("pairplot" %in% names(res))
  expect_true("nb_num_features" %in% names(res))
})

test_that('Test the length of numerical features', {
  res <- eda(df,"target")
  expect_true(res$nb_num_features == 4)
})

test_that('Test the length of categorical features', {
  res <- eda(df,"target")
  expect_true(res$nb_cat_features == 1)
})

test_that('Check numerical features names', {
  res <- eda(df,"target")
  expect_true("num1" %in% res$num_features_name)
})

test_that('Check categorical features names', {
  res <- eda(df,"target")
  expect_true("cat1" %in% res$cat_features_name)
})

test_that('Check class labels', {
  res <- eda(df,"target")
  expect_equivalent(res$nb_class, c(1,2,3))
})

test_that('Missing values',{
  res <- eda(df,"target")
  expect_equivalent(res$missing,
                    data.frame(num1 = c(0),
                              num2 = c(0),
                              num3 = c(0),
                              num4 = c(0),
                              cat1 = c(0)))
})

# handle exception
test_that('Check if user provides a data frame', {
    expect_error(eda(ls,"target"))
})

test_that('Check if user provides a correct column name', {
    expect_error(eda(df,"targ"))
})
