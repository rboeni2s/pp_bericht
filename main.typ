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
Ich beschränke mich darauf die Aufgaben des @IFA zu beschreiben, da dies das Institut der @DGUV ist in welchem mein Praxisprojekt
stattgefunden hat.

"Das IFA unterstützt die Präventionsarbeit der Berufsgenossenschaften
und Unfallkassen. Seine Mitarbeitenden forschen, analysieren und bera-
ten zu naturwissenschaftlich-technischen Fragen des Arbeits- und Ge-
sundheitsschutzes. Darüber hinaus bietet das Institut Produktprüfungen
und -zertifizierungen an." (@IFA Jahresbericht 2024 @infa_jahresbericht_2024, S.4)

Das @IFA hat 5 wissenschaftliche, technische Hauptarbeitskapazitäten; namentlich sind das die Analytik,
Prüfung und Zertifizierung, (technische) Infrastruktur, Entwicklung und Untersuchung und zu guter Letzt die Beratung @infa_jahresbericht_2024.
Dabei hat das IFA unter anderem die Aufgaben, Gefährdungen des Arbeitsschutzes zu erforschen, Schutzmaßnahmen zu entwickeln
und Richtlinien diesbezüglich zu erarbeiten und/oder bei deren Prüfung zu assistieren.

Die Tätigkeiten, an die ich im Rahmen meines Praxisprojekts am meisten herangeführt wurde, waren die Arbeiten im Zusammenhang mit
der Sicherheitsfachgrundnorm DIN EN ISO 13849-1, welche die Anforderungs- und Maßnahmenerhebung für Maschinensteuerungen normt.

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
    columns: (auto, auto, 1fr),
    table.header([Bedingung], [Beschreibung], [Begründung]),

    // Import / Export
    [Sistemaprojekt Import/Export],
    [@SBE soll in der Lage sein \ Sistemaprojekte zu laden \ und zu exportieren],
    [
      Der Im- und Export von Sistemaprojekten ist eine einfache und intuitive Art
      und Weise um die zwei Anwendungen miteinander zu verbinden. Bestehende Nutzer haben
      ihre Projekte bereits im SISTEMA-Format gespeichert und würden so eine Funktionen vom
      @SBE erwarten.
    ],
  ),
)

= Umsetzung und Ergebnisse


= Bezug zum bisherigen Studium


= Fachliche und persönliche Erfahrungen
