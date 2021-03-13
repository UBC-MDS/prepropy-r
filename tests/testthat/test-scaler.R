df <- data.frame(a = 1:3, b = 10:12)
df_nonnum <- data.frame(a = 1:3, b = 'hello')
df_minmax <- data.frame(a=c(0.0,0.5,1.0), b=c(0.0,0.5,1.0))
df_sd <- data.frame(a=c(-1,0,1), b=c(-1,0,1))
out_minmax <- list()
out_minmax$train <- df_minmax
out_minmax$test <- df_minmax
out_minmax$valid <- df_minmax
out_sd <- list()
out_sd$train <- df_sd
out_sd$test <- df_sd
out_sd$valid <- df_sd

 test_that('tests for exceptions', {

   #Checking data in input
   expect_error(scaler(df,df,df_nonnum, 'standardization'))
   expect_error(scaler(df,df_nonnum,df, 'standardization'))
   expect_error(scaler(df_nonnum,df,df, 'standardization'))

   #Checking Input Type
   expect_error(scaler(41,df,df, 'standardization'))
   expect_error(scaler(df,41,df, 'standardization'))
   expect_error(scaler(df,df,41, 'standardization'))

   #Checking method
   expect_error(scaler(df,df,df, 'skscaler'))
 })

 test_that("Tests to check outputs", {
   # test standardization
   expect_equal(scaler(df, df, df, 'standardization'), out_sd)
   # test minmax
   expect_equal(scaler(df, df, df, 'minmax'), out_minmax)
})
