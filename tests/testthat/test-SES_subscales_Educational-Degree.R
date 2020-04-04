library(psychTestR)
library(psyquest)
library(testthat)

dir <-
  system.file("tests/SES_DE_subscales_Educational-Degree", package = "psyquest", mustWork = TRUE)
app <- AppTester$new(dir)

app$expect_ui_text("Bitte gebe Deine ID ein Weiter")
app$set_inputs(p_id = "abcde")
app$click_next()

app$expect_ui_text("Welchen höchsten Bildungsabschluss hat deine Mutter? Keinen Schulabschluss Haupt- oder Realschulabschluss Berufsausbildung Fachhochschulreife oder Abitur Fachhochschulabschluss, Diplom, Bachelor an Universität (3 Jahre and der Uni) höherer Universitätsabschluss (z. B. Magister, Staatsexamen, Master, Doktor, d.h. mindestens 5 Jahre an der Uni)) Weiß ich nicht Weiter")
cb <- app$findElement(css = "input[value=choice6]")
cb$click()
app$click_next()

app$expect_ui_text("Welchen höchsten Bildungsabschluss hat dein Vater? Keinen Schulabschluss Haupt- oder Realschulabschluss Berufsausbildung Fachhochschulreife oder Abitur Fachhochschulabschluss, Diplom, Bachelor an Universität (3 Jahre and der Uni) höherer Universitätsabschluss (z. B. Magister, Staatsexamen, Master, Doktor, d.h. mindestens 5 Jahre an der Uni)) Weiß ich nicht Weiter")
cb <- app$findElement(css = "input[value=choice5]")
cb$click()
app$click_next()

app$expect_ui_text("Deine Ergebnisse wurden gespeichert. Du kannst das Browserfenster jetzt schließen.")

results <- app$get_results() %>% as.list()

expect_equal(names(results), c("SES"))
expect_equal(
  results[["SES"]],
  list(
    q1 = "choice6",
    q2 = "choice5",
    educational_degree = 1.5
  )
)

app$stop()