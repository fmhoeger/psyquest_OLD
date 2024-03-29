context("CCM")
library(psychTestR)

app <- AppTester$new("apps/CCM_DE")

app$expect_ui_text("Bitte gib Deine ID ein Weiter")
app$set_inputs(p_id = "abcde")
app$click_next()

app$expect_ui_text("Bitte lies die folgende Liste mit musikalischen Aktivitäten und wähle die aus, die du in den vergangenen drei Monaten gemacht hast. Bitte klicke alles Zutreffende an. in einem Orchester gespielt mit Freunden Musik gemacht bei Events, Konzerten oder speziellen Gelegenheiten Musik gemacht Einzelunterricht an einem Instrument (oder Gesang) erhalten Gruppenunterricht an einem Instrument (oder Gesang) erhalten Musikunterricht in der Schule gehabt an (einer) Musik-AG(s) nach der Schule teilgenommen Playlists für mich oder andere zusammengestellt nichts der oben genannten Aktivitäten Weiter")
cb <- app$findElement(css = "input[value=choice9]")
cb$click()
app$click_next()

app$expect_ui_text("In den vergangenen drei Monaten hatte ich 0 Schulstunden Musikunterricht pro Woche 1 Schulstunde Musikunterricht pro Woche 2 Schulstunden Musikunterricht pro Woche 3 Schulstunden Musikunterricht pro Woche 4 oder mehr Schulstunden Musikunterricht pro Woche Weiter")
rb <- app$findElement(css = "input[value=choice1]")
rb$click()
app$click_next()

app$expect_ui_text("In den vergangenen drei Monaten hatte ich 0 Schulstunden Musik-AG pro Woche 1 Schulstunde Musik-AG pro Woche 2 Schulstunden Musik-AG pro Woche 3 Schulstunden Musik-AG pro Woche 4 oder mehr Schulstunden Musik-AG pro Woche Weiter")
rb <- app$findElement(css = "input[value=choice1]")
rb$click()
app$click_next()

app$expect_ui_text("Wie oft übst du im Moment dein(e) Instrument(e)? 0 Minuten pro Tag 0-15 Minuten pro Tag 15-30 Minuten pro Tag 30-60 Minuten pro Tag 1-1,5 Stunden pro Tag 1,5-2 Stunden pro Tag mehr als 2 Stunden pro Tag Weiter")
rb <- app$findElement(css = "input[value=choice1]")
rb$click()
app$click_next()

app$expect_ui_text("Alles zusammen genommen (eigenes Üben, Proben, Instrumentalunterricht, Auftritte etc.), wie viel Zeit verbringst du im Moment pro Woche damit, Musik zu machen? 0 Stunden pro Woche 0-1 Stunde pro Woche 1-2 Stunden pro Woche 2-4 Stunden pro Woche 4-7 Stunden pro Woche 7-14 Stunden pro Woche mehr als 14 Stunden pro Woche Weiter")
rb <- app$findElement(css = "input[value=choice1]")
rb$click()
app$click_next()

results <- app$get_results() %>% as.list()
expect_equal(names(results), c("CCM"))
expect_equal(
  results[["CCM"]],
  list(
    q1 = "choice9",
    q2 = "choice1",
    q3 = "choice1",
    q4 = "choice1",
    q5 = "choice1",
    General = -2.5421857,
    Extra = 1
  )
)

app$stop()
