#import "lib/hbrs_template.typ": template

#show: template.with(
  meta: (
    kind: "prakt",
    title: [
      Konzeption und Entwicklung einer Software \ zur Erstellung sicherheitsbezogener Blockdiagramme \ gemäß EN ISO 13849 mit Anbindung an SISTEMA 3.0
    ],
    author: "Rejk Böning",
    degree: [Informatik B.Sc.],
    first_examiner: "Prof. Dr. Stefan Böhmer",
    second_examiner: "Andy Lungfiel",
    submitted_on: "10.7.2026 (Vorläufig)",
    bibliography: "references.bib",
  ),
)


= Der Weg zum Unternehmen
Im Februar 2026 habe ich mich durch eine Initiativbewerbung bei der Deutschen Gesetzlichen Unfallversicherung (@DGUV:s)
im @IFA auf eine Praxisprojektstelle beworben. Erfreulicherweise konnte mir die @DGUV:s mehrere Projekte anbieten, die
für ein Praxisprojekt geeignet wären. In Absprache mit der @DGUV:s wurde entschieden, dass ich an einer neuen Software zur
erstellung sicherheitsbezogener Blockdiagramme arbeiten könnte, auf Basis deren sich auch eine Abschlussarbeit schreiben lassen würde.

Auf die @DGUV:s bin ich durch Ihre Nähe zur Hochschule und positive Arbeitserfahrungen von Verwandten aufmerksam geworden.
Schlussendlich überzeugt, mein Praxisprojekt bei der @DGUV:s absolvieren zu wollen, hat mich sowohl das Angebot, dort meine
Bachelorarbeit schreiben zu können, als auch die interessanten und netten Präsentationen zu den Projektmöglichkeiten, die ich dort erhielt.

= Das Unternehmen

== Unternehmensdaten
Die @DGUV ist der Spitzenverband der gewerblichen Berufsgenossenschaften und der Unfallversicherungsträger der öffentlichen Hand @dguv_about.
Dieser wurde am 01.06.2007 durch die Zusammenlegung des Hauptverbandes der gewerblichen Berufsgenossenschaften e. V. (HVBG)
und des Bundesverbandes der Unfallkassen e. V. (BUK) gegründet @dguv_satzung. Der HVBG wurde 1887 gegründet während der
BUK 1936 gegründet wurde.

#figure(
  caption: ["Übersicht über die Unternehmensdaten"],
  {
    show table.cell.where(x: 0): strong
    show table.cell: set text(size: 9pt)
    table(
      align: left,
      columns: (auto, 1fr),
      table.header(table.cell(colspan: 2, [@DGUV:l])),
      [Vollständiger Name], [Deutsche Gesetzliche Unfallversicherung e.V. (DGUV)],
      [Standort Berlin], [Glinkastraße 40, 10117 Berlin],
      [Standort Bonn], [Alte Heerstraße 111, 53757 Sankt Augustin],
      [Hauptsitz], [Berlin],
      [Gründung], [01.06.2007],
    )
  },
)

== Unternehmensaufgaben
Die Aufgaben des @IFA sind extrem vielfältig und ausschweifend #footnote[
  Ich beschränke mich darauf nur die Aufgaben des @IFA zu beschreiben, da dies das Institut der @DGUV ist in welchem mein Praxisprojekt
  stattgefunden hat.
],
trotzdem schafft es der IFA-Jahresbericht für das Jahr 2024
die Aufgaben des @IFA in wenigen Sätzen zu beschreiben:

"Das IFA unterstützt die Präventionsarbeit der Berufsgenossenschaften
und Unfallkassen. Seine Mitarbeitenden forschen, analysieren und beraten
zu naturwissenschaftlich-technischen Fragen des Arbeits- und
Ge-sundheitsschutzes. Darüber hinaus bietet das Institut Produktprüfungen
und -zertifizierungen an." (@IFA Jahresbericht 2024 @infa_jahresbericht_2024, S.4)

Das @IFA hat 5 wissenschaftliche, technische Hauptarbeitskapazitäten; namentlich sind das die Analytik(1),
Prüfung und Zertifizierung(2), (technische) Infrastruktur(3), Entwicklung und Untersuchung(4) und zu guter Letzt die Beratung(5) @infa_jahresbericht_2024.
Dabei übernimmt das @IFA of die Aufgabe Gefährdungen des Arbeitsschutzes zu erforschen, Schutzmaßnahmen zu entwickeln
und Richtlinien diesbezüglich zu erarbeiten und/oder bei deren Prüfung zu assistieren.

Die Tätigkeiten, an die ich im Rahmen meines Praxisprojekts am meisten herangeführt wurde, waren die Arbeiten im Zusammenhang mit
der Sicherheitsfachgrundnorm DIN EN ISO 13849-1. Diese normt die Anforderungs- und Maßnahmenerhebungen für Maschinensteuerungen
bezüglich ihrer funktionalen Sicherheit.

#figure(
  caption: ["Auszug aus dem Jahresbericht 2024 @infa_jahresbericht_2024 S.4"],
  image("res/ifa_2024_jahresbericht_aufgaben.png"),
)

= Aufgabe

== Allgemeine Aufgabenbeschreibung
Die Norm DIN EN ISO 13849-1 beschreibt Anforderungen an sicherheitsbezogene Teile von
Machienensteuerungen und deren Bewertung hinsichtlich eines sogennannten @PL. Für die Bestimmung
dieses @PL bietet das @IFA bereits SISTEMA an, eine umfangreiche Anwendung für die
struckturelle Modellierung, Dokumentierung und anschließende @PL bestimmung von Maschienensteuerungen.

Teil der Vorarbeit zur berechnung und dokumentation der Sicherheitsfunktionen einer
Steuerung in SISTEMA ist die Transformation von einem elektrischen Schaltplan in ein
sicherheitsbezogenes Blockdiagramm.

#figure(
  caption: [Auszüge eines Schaltplans und seines Blockdiagramms aus dem IFA-Report 2017 (*TODO: QUELLE HIER EINFÜGEN*) S.120-121],
  image("res/vergleich_diagramm_schaltplan.jpg"),
)

Dieser Transformationsschritt stellt in der Praxis eine besondere Herausforderung dar.
Während Schaltpläne die physikalische Verschaltung von Komponenten beschreiben, bildet
das sicherheitsbezogene Blockdiagramm die logische Struktur der Sicherheitsfunktion mit
ihren Funktions-, Test- und Diagnosepfaden ab. Die Ableitung erfolgt bislang überwiegend
manuell und erfordert umfangreiches Expertenwissen.

Um den Prozess der Blockdiagrammerstellung angenehmer und weniger Fehleranfällig zu gestallten soll als Ziel meines
Praxisprojekts ein Anwendungsprototyp erstellt werden. Dieser soll es Nutzern erlauben, grafisch geführt,
sicherheitsbezogene Blockdiagramme zu entwerfen und zu dokumentieren. Die Diagramme und Dokumentation sollen von
der Software als SISTEMA-Projekt exportiert werden können.


== Projektvorgaben
Der Anwendungsprototyp @SBE soll als Komplementärsoftware zu SISTEMA entwickelt werden. Das bedeutet, dass sich der @SBE möglichst
nahtlos in einem bereits bestehenden Worklflow mit SISTEMA integrieren lassen soll. Er muss deshalb für die bestehenden SISTEMA-Nutzer
leicht verständlich, nützlich und zugänglich sein. Das Achten auf "SISTEMA-Kompatibilität" ist für den @SBE besonders wichtig,
da rund 70 bis 80% der globalen Normanwender SISTEMA verwendet @sistema_projekt_verzeichnis.

Diese enge bindung an SISTEMA gibt dem @SBE eine Reihe an Rahmenbedingungen vor.

#figure(
  caption: [Durch SISTEMA beeinflusste Rahmenbedingungen],
  table(
    columns: (20%, 40%, 40%),
    table.header([Bedingung], [Beschreibung], [Begründung]),

    // Import / Export
    [Sistemaprojekt Import/Export],
    [@SBE soll in der Lage sein Sistemaprojekte zu laden und zu exportieren],
    [
      Der Im- und Export von Sistemaprojekten ist eine einfache und intuitive Art
      und Weise um die zwei Anwendungen miteinander zu verbinden. Bestehende Nutzer haben
      ihre Projekte bereits im SISTEMA-Format gespeichert und würden so eine Funktionen vom
      @SBE erwarten.
    ],

    // Übersetzbarkeit
    [@SBE muss Übersetzbar sein],
    [
      Die Anwendung soll in alle von SISTEMA unterstützten Sprachen übersetzbar sein.
      Diese Übersetzungen sollen zur Laufzeit dargestellt werden. Zudem soll die Systemsprache
      des Nutzers erkannt und standartmäßig in @SBE eingestellt sein.
    ],
    [
      Da SISTEMA international verwendet wird ist eine gute Unterstützung von verschiedenen
      Sprachen unumgänglich.
    ],

    // Anwendungsumgebung
    [Selbe Platform-unterstützung wie SISTEMA],
    [
      Die Anwendung soll als Desktopanwendung für Windows 10 und 11 zur verfügung stehen.
      Es sollen keine zusätzlichen Laufzeitumgebungen oder Abhängigkeitewn für die inbetriebnahme erforderlich sein.
    ],
    [
      Der @SBE soll mindestens auf den selben Platformen wie SISTEMA zur verfügung stehen,
      damit die Anwendung allen SISTEMA-Nutzern zur verfügung stehen kann.
    ],
  ),
)

Während diese Rahmenbedingungen eingehalten werden soll der @SBE folgende Funktionen bereitstellen:

- Ein Projekt soll mehrere Sicherheitsfunktionen und eine Projektdokumentation enthalten können. Dieses Projekt soll in @SBE
  erstellt, gespeichert, geladen und bearbeitet werden können. Dieses Projekt wäre das Ziel für einen Import/Export zwischen
  SISTEMA und @SBE.

- Für jede Sicherheitsfunktion soll der Nutzer in der Lage sein Dokumentation und ein Blockdiagramm zu erstellen.
  Die Blockdiagramme sollen normkonform sein und aus Teilsystemen mit Bauteilen bestehen die der Nutzer ebenfalls
  pro Sicherheitsfunktion verwalten kann.

- @SBE soll zusätzlich zum Import/Export von SISTEMA Projekten eine "nahtlose" zusammenarbeit mit SISTEMA ermöglichen.
  Es ist geplant, dass der @SBE nicht nur als Eigenständige Anwendung verfügbar ist, sondern auch als eine art Plugin
  in SISTEMA.

- Das Bearbeiten der Blockdiagramme soll intuitiv und zeitsparend sein. Dazu sollte die Bearbeitung der Diagramme
  zum einem großen Teil mittel "Drag'n Drop" möglich sein.

- Um das erstellen der Diagramma Workflowtechnisch von dem Dokumentieren der in den Diagrammen enthaltenen Bauteile zu trennen
  soll ein Nutzer in der Lage sein, seine Bauteile in einer Bauteilbibliothek anzulegen und zu dokumentieren bevor er beginnt
  das Diagramm zu erstellen.

- Das Programm soll eine angenehme Menüführung haben und Anwenderfreundlich sein. Das beinhaltet eine "schnelle", moderne
  Benutzeroberfläche und QOL-Features wie etwa eine Undo/Redo Funktionalität.


= Umsetzung und Ergebnisse

== Auswahl der Entwicklungswerkzeuge
Da der @SBE eine von grundauf neu entwickelte Anwendung sein wird, musste ich die Entscheidung welche Programmiersprache(n),
Frameworks und andere Entwicklungswerkzeuge ich für die Entwicklung verwenden möchte selbst treffen.

In Anbetracht der Rahmenbedingungen, dass der @SBE keine zusätzlichen Installationen von Laufzeitumgebungen oder Abhängigkeiten
vom Endanwender erfordern soll UND als Plugin oder Bibliothek für SISTEMA zur Verfügung stehen soll, habe ich mich gegen eine Sprache
wie etwa Python oder Java entschieden, da beide sprachen zwar populäre Sprachen für die Desktopanwendungsentwicklung sind aber
auf die Installation oder der Bundeln von Laufzeitumgebungen oder dem Pythoninterpreter erfordern. Zusätzlich wäre es aufwändiger den @SBE
für SISTEMA als Plugin oder Bibliotehk verfügbar zu machen.


= Bezug zum bisherigen Studium


= Fachliche und persönliche Erfahrungen
