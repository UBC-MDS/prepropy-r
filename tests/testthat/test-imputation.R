df_1 <- data.frame('a' = c(NA, 4, 10), 'b' = c(2, NA, 5), 'c' = c(3,6,9))
df_1_t <- data.frame('a' = c(7, 4, 10), 'b' = c(2, 3.5, 5), 'c' = c(3,6,9))
df_2 <- data.frame('a' = c(NA, 4, 10, 3), 'b' = c(2, NA, 5, 15), 'c' = c(3, 6, 9, 17))
df_2_t <- data.frame('a' = c(4.0, 4, 10, 3), 'b' = c(2, 5.0, 5, 15), 'c' = c(3, 6, 9, 17))
df_3 <- data.frame('a' = c(NA, 'd', 'd'), 'b' = c('b', NA, 'x'), 'c' = c('c','f',NA))
df_3_t <- data.frame('a' = c('test', 'd', 'd'), 'b' = c('b','test', 'x'), 'c' = c('c','f','test'))
df_m <- data.frame('a' = c(NA, 4, 10), 'b' = c('a', NA, 'b'), 'c' = c(3,6,9))
df_m_t <- data.frame('a' = c('test', 4, 10), 'b' = c('a', 'test', 'b'), 'c' = c(3,6,9))

test_that("imputation returns output as expected given different methods", {
  # test mean
  expect_equal(imputation(df_1, df_1, 'mean'), df_1_t)
  # test median
  expect_equal(imputation(df_2, df_2, 'median'), df_2_t)
  # test for constant
  expect_equal(imputation(df_3, df_3, 'constant', 'test'), df_3_t)
  # test for mean imputation when no NAN values
  expect_equal(imputation(df_1_t, df_1_t, 'mean'), df_1_t)
  # test for constant imputation when dataframe has mixed data type columns
  expect_equal(imputation(df_m, df_m, 'constant', 'test'), df_m_t)
  # test for dataframe when there is only a single value
  expect_equal(imputation(data.frame('a' = c(1)), data.frame('a' = c(1)), 'mean'), data.frame('a' = c(1)))
})

test_that('tests whether exceptions will raise as expected', {
  # test for entering non data.frame() into the function as fit_data
  expect_error(imputation(1,df_1, 'mean'))
  # test for entering non data.frame() into the function as fill_data
  expect_error(imputation(df_1,1, 'mean'))
  # test for using non existing method
  expect_error(imputation(df_1, df_1, 'test'))
  # test for imputation when number of columns of fit_data doesn't equal to fill_data
  expect_error(imputation(df_1, data.frame('a' = c(1)), 'mean'))
  # test for whether fit data is all numeric when mean/median is selected as method
  expect_error(imputation(df_3, df_3, 'mean'))
})
