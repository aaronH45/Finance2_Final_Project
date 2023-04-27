library(plm)
library(stargazer)
setwd("C:\\Users\\aaron\\OneDrive\\Desktop\\homework\\finance2\\Finance2_Final_Project")
df <- read.csv(file.path(getwd(), "df_final.csv"))

# Table 1
reg1 <- plm(spread_change ~  rescaled_similarity, data = df)
reg2 <- plm(spread_change ~  rescaled_similarity, data = df, index = c("TICKER"),
            model = "within", effect = "time")
reg3 <- plm(spread_change ~  rescaled_similarity, data = df, index = c("year"),
            model = "within", effect = "time")
reg4 <- plm(spread_change ~  rescaled_similarity, data = df, index = c("TICKER", "year"),
            model = "within", effect = "time")

table4 <- stargazer(reg1, reg2, reg3, reg4, title="Table 1", align=TRUE,
                    out=file.path(getwd(), "Output", "table4.tex"))

pre_df <- subset(df, year <= 2002)
post_df <- subset(df, year > 2002)


# Table 2
reg1 <- plm(rescaled_similarity ~  rescaled_similarity_lagged + num_disc, data = df, index = c("company"),
            model = "within", effect = "time")
reg2 <- plm(rescaled_similarity ~  rescaled_similarity_lagged + num_disc, data = df, index = c("company", "year"),
            model = "within", effect = "time")

table4 <- stargazer(reg1, reg2, title="Table 2", align=TRUE,
                    out=file.path(getwd(), "Output", "table4.tex"))

# Table 3
reg1 <- plm(rescaled_similarity ~  rescaled_similarity_lagged + num_disc, data = df, index = c("company"),
            model = "within", effect = "time")
reg2 <- plm(rescaled_similarity ~  rescaled_similarity_lagged + num_disc, data = df, index = c("company", "year"),
            model = "within", effect = "time")

table4 <- stargazer(reg1, reg2, title="Table 3", align=TRUE,
                    out=file.path(getwd(), "Output", "table4.tex"))
