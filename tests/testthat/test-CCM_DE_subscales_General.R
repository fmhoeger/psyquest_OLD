context("CCM")
library(psychTestR)

app <- AppTester$new("apps/CCM_DE_subscales_General")

app$expect_ui_text("Bitte gib Deine ID ein Weiter")
app$set_inputs(p_id = "abcde")
app$click_next()

app$expect_ui_text("Bitte lies die folgende Liste mit musikalischen Aktivitäten und wähle die aus, die du in den vergangenen drei Monaten gemacht hast. Bitte klicke alles Zutreffende an. in einem Orchester gespielt mit Freunden Musik gemacht bei Events, Konzerten oder speziellen Gelegenheiten Musik gemacht Einzelunterricht an einem Instrument (oder Gesang) erhalten Gruppenunterricht an einem Instrument (oder Gesang) erhalten Musikunterricht in der Schule gehabt an (einer) Musik-AG(s) nach der Schule teilgenommen Playlists für mich oder andere zusammengestellt nichts der oben genannten Aktivitäten Weiter")
cb <- app$findElement(css = "input[value=choice1]")
cb$click()
cb <- app$findElement(css = "input[value=choice3]")
cb$click()
cb <- app$findElement(css = "input[value=choice5]")
cb$click()
cb <- app$findElement(css = "input[value=choice7]")
cb$click()
app$click_next()

app$expect_ui_text("Wie oft übst du im Moment dein(e) Instrument(e)? 0 Minuten pro Tag 0-15 Minuten pro Tag 15-30 Minuten pro Tag 30-60 Minuten pro Tag 1-1,5 Stunden pro Tag 1,5-2 Stunden pro Tag mehr als 2 Stunden pro Tag Weiter")
rb <- app$findElement(css = "input[value=choice4]")
rb$click()
app$click_next()

app$expect_ui_text("Alles zusammen genommen (eigenes Üben, Proben, Instrumentalunterricht, Auftritte etc.), wie viel Zeit verbringst du im Moment pro Woche damit, Musik zu machen? 0 Stunden pro Woche 0-1 Stunde pro Woche 1-2 Stunden pro Woche 2-4 Stunden pro Woche 4-7 Stunden pro Woche 7-14 Stunden pro Woche mehr als 14 Stunden pro Woche Weiter")
rb <- app$findElement(css = "input[value=choice5]")
rb$click()
app$click_next()

results <- app$get_results() %>% as.list()
expect_equal(names(results), c("CCM"))
expect_equal(
  results[["CCM"]],
  list(
    q1 = "choice1,choice3,choice5,choice7",
    q4 = "choice4",
    q5 = "choice5",
    General = 3.7918376
  )
)

app$stop()
