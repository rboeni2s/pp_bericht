#import "lib/hbrs_template.typ": footnote, template
#import "@preview/mmdr:0.2.2": mermaid
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *


#show: codly-init.with()
#codly(zebra-fill: none)

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
    [1) Sistemaprojekt Import/Export],
    [@SBE soll in der Lage sein Sistemaprojekte zu laden und zu exportieren],
    [
      Der Im- und Export von Sistemaprojekten ist eine einfache und intuitive Art
      und Weise um die zwei Anwendungen miteinander zu verbinden. Bestehende Nutzer haben
      ihre Projekte bereits im SISTEMA-Format gespeichert und würden so eine Funktionen vom
      @SBE erwarten.
    ],

    // Übersetzbarkeit
    [2) @SBE muss Übersetzbar sein],
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
    [3) Selbe Platform-unterstützung wie SISTEMA],
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
  erstellt, gespeichert, geladen und bearbeitet werden können. Das selbe Projekt wäre auch das Ziel für einen Import/Export zwischen
  SISTEMA und @SBE.

- Für jede Sicherheitsfunktion soll der Nutzer in der Lage sein Dokumentation und ein Blockdiagramm zu erstellen.
  Die Blockdiagramme sollen normkonform sein und aus Teilsystemen mit Bauteilen bestehen die der Nutzer ebenfalls
  pro Sicherheitsfunktion verwalten kann.

- @SBE soll zusätzlich zum Import/Export von SISTEMA Projekten eine "nahtlose" zusammenarbeit mit SISTEMA ermöglichen.
  Es ist geplant, dass der @SBE nicht nur als Eigenständige Anwendung verfügbar ist, sondern auch als eine art Plugin
  in SISTEMA.

- Das Bearbeiten der Blockdiagramme soll intuitiv und zeitsparend sein. Dazu sollte die Bearbeitung der Diagramme
  zum einem großen Teil mittel "Drag'n Drop" möglich sein.

- Um das erstellen der Diagramme Workflowtechnisch von dem Dokumentieren der in den Diagrammen enthaltenen Bauteile zu trennen
  soll ein Nutzer in der Lage sein, seine Bauteile in einer Bauteilbibliothek anzulegen und zu dokumentieren bevor er beginnt
  das Diagramm zu erstellen.

- Das Programm soll eine angenehme Menüführung haben und Anwenderfreundlich sein. Das beinhaltet eine "schnelle", moderne
  Benutzeroberfläche und @QOL Features wie etwa eine Undo/Redo Funktionalität.


= Umsetzung

== Auswahl der Entwicklungstechonolgien
Da der @SBE eine von grundauf neu entwickelte Anwendung sein wird, musste ich die Entscheidung welche Programmiersprache(n),
Frameworks und andere Entwicklungswerkzeuge ich für die Entwicklung verwenden möchte selbst treffen.

In Anbetracht der Rahmenbedingungen, dass der @SBE keine zusätzlichen Installationen von Laufzeitumgebungen oder Abhängigkeiten
vom Endanwender erfordern soll UND als Plugin oder Bibliothek für SISTEMA zur Verfügung stehen soll, habe ich mich gegen eine Sprache
wie etwa Python oder Java entschieden. Beide Sprachen sind zwar populäre Sprachen für die Desktopanwendungsentwicklung, erfordern aber
die Installation oder das Bundeln von Laufzeitumgebungen oder dem Pythoninterpreter. Zusätzlich wäre es aufwändiger den @SBE
für SISTEMA als Plugin oder Bibliotehk verfügbar zu machen.

Da ich die Einbettung des @SBE in SISTEMA am liebsten durch eine Shared-Library gelöst hätte, habe ich mich entschieden eine
Kompilierte Sprache wie C++ oder Rust zu verwenden. Das würde es mir auch erlauben alle Ressourcen und Abhängigkeiten die
der  @SBE verwenden wird, mittels dem Linker in der ausführbaren Programmdatei (Binary) ein zu betten um so der Rahmenbedingung
3) noch mehr entgegen zu kommen.

Schlussendlich ist meine Auswahl auf Rust gefallen, da ich durch vorherige Arbeit und Hobby-Projekte sehr gute Erfahrungen
mit Rust und seinem Build- und Ecosystem gemacht habe und mir sicher war, alle Rahmenbedingungen und Features zügig und
zuverlässig in Rust implementieren zu können. Für einen Rust-Kompatiblen UI-Framework ist meine Wahl dabei auf Slint @slint
gefallen, hauptsächlich wegen der guten unterstützung von Übersetzungen in der UI und einer Reihe an Tests die ich zu Anfang der
Entwicklung mit Slint implementiert habe #footnote[
  Um den Bericht kurz zu halten werde ich auf diese Tests nicht näher eingehen.
].

#figure(
  caption: ["Dummy" Graph-Editor in Rust und Slint als Test der Entwicklungswerkzeuge implementiert],
  image("res/graph_test.png"),
)


== Implementierung
Da eine komplette beschreibung der Implementieriung über den Rahmen dieses Berichts hinausgehen würde, werde ich einen kurzen Übertblick
über die Projektstrucktur und Architektur geben und dann die Implementation einiger ausgewählter Features näher erläutern.

Das Projekt ist in 5 Crates #footnote[Eine Rust-"Crate" wäre in anderen Sprachen eine Programmbibliothek], mit folgenden Aufgaben
aufgeteilt

#figure(
  caption: [Projekt Crate Übersicht],
  table(
    columns: (auto, auto, 1fr),
    table.header([Crate], [Typ], [Aufgabe]),

    [bedit],
    [Library],
    [
      Rust library crate für die @SBE Awendung. Beinhaltet die Benutzeroberfläche und das Backend von @SBE.
    ],

    [bedit_app],
    [Binary],
    [
      Binary crate für die @SBE Awendung. Konsumiert die bedit crate und macht sie Als "Standalone" Anwendung verfügbar.
    ],

    [sbe_sis],
    [Dynamic Library],
    [
      Ein C-Kompatibler Wrapper für die bedit Crate. Macht die bedit library für andere Anwendungen als Shared-Library
      verfügbar. Da bedit selbst kein C-Kompatibles (oder überhaupt stabiles) @ABI hat, braucht es eine schmale Schnittstelle, die von anderen Anwendungen
      durch normales Linken oder ein FFI-Interface konsumiert werden kann.
    ],

    [sistema],
    [Library],
    [
      Stellt einen SISTEMA-Projektdatei-Parser bereit, der (beidseitig) zwischen dem SISTEMA-Speicherformat (.ssm) und einer Rust Datenstrucktur
      konvertieren kann.
    ],

    [delta],
    [Library],
    [
      Implementation eines Generischen Undo/Redo Systems, dass die Differenz zwischen 2 Objekten einer Datenstrucktur
      erkennen und versionieren kann. Das System ist vollständig serialisierbar um z.B. das automatische speichern von wiederherstellen von
      Sicherungskopien zu ermöglichen.
    ],
  ),
)

#pagebreak()

Eine grobe veranschaulichung der Struckturen jeder Crate bieten folgende Graphen.
Höher auflösende Versionen dieser Graphen liegen dem Digitalen Bericht bei#footnote[
  Diese Graphen sind sehr schwer zu lesen und dienen nur einer Veranschaulichung des Projektumfangs.
  An Stellen, wo eine Visualisieuing der Projektstrucktur Sinn macht werde ich eine vereinfachte und besser lesliche Darstellung Wählen.
]

#figure(
  caption: [Graphbasierte der Übersicht der "bedit" crate],
  rect(image("res/bedit_structure_full.svg")),
)

#figure(
  caption: [Graphbasierte der Übersicht der "sistema" crate],
  rect(image("res/sistema_structure_full.svg")),
)

#figure(
  caption: [Graphbasierte der Übersicht der "delta" crate],
  rect(image("res/delta_structure_full.svg")),
)

#figure(
  caption: [Graphbasierte der Übersicht der "sbe_sis" crate],
  rect(image("res/sbe_sis_structure_full.svg")),
)

#figure(
  caption: [Graphbasierte der Übersicht der "bedit_app" crate],
  rect(image("res/bedit_app_structure_full.svg")),
)


== Architektur der Anwendung

=== Slint als View im MVC Kontext
Der @SBE muss in der Lage sein Daten aus seinem Datenmodel auf der Benutzeroberfläche darzustellen und diese
bei Änderung der Daten aktualisieren. Zudem müssen Änderungen der Daten in der Benutzeroberfläche auch im Datenmodell
des @SBE reflektiert werden. Dies lässt sich durch ein @MVC Entwurfsmuster@patternsofEAA elegant Lösen.

Der UI-Framework Slint funktioniert gut unter verwendung dieses Entwurfsmusters, da er keinen direkten Zugriff auf Elemente
der Nutzeroberfläche erlaubt, sondern die verwendung von "Callbacks" und sogenannten "Properties" erzwingt.

Elemente einer Benutzeroberfläche heißen Komponenten in Slint und werden durch eine @DSL beschrieben, diese kann entweder zur Laufzeit interpretiert
oder vor dem Kompilieren der Anwendung kompiliert werden. Eben erwähnte Properties und Callbacks müssen im @DSL definiert sein
und können damit, für eine Anwendung, die Slint benutzt, das Interface eines Views in einem @MVC Kontext beschreiben.

Das folgende Beispiel verdeutlicht die Rolle von Slint-Callbacks und Properties:

Lediglich die grün markierten Stellen können durch den Rustcode verändert oder gelesen werden.
Es kann also nicht direkt auf den Text der `Text`-Komponente im Beispiel zugegriffen werden
und auch die `TouchArea` hat keine möglichkeit direkt auf das Datenmodell zu zugreifen.
Soll der Text verändert werden, müssten Textdaten an das `my_text` Property gesendet werden
und um auf einen Klick zu reagieren müsste ein Objekt sich für das `my_callback()` Callback eingetragen haben.

Wenn an ein @MVC Muster implementiert werden soll könnte man sich leicht vorstellen, das ein Controller Struct erstellt wird,
dass auf `my_callback()` reagieren und in `my_text` schreiben kann und damit als Brücke zwischen View und Model agiert.

#figure(
  supplement: [Beispiel],
  caption: [Beispiel Slint-Komponente mit einem Callback und einem Property],

  grid(
    columns: (70%, auto),
    gutter: 2mm,
    [
      #codly(
        languages: codly-languages,
        inset: 0.08em,
        highlights: (
          (line: 3, start: 3, end: none, fill: green),
          (line: 4, start: 3, end: none, fill: green),
        ),
      )
      ```slint
      component MyComponent inherits Window
      {
        in-out property <string> my_text: "Hallo";
        callback my_callback();

        Rectangle // Zeigt ein rotes Quadrat an
        {
          width: 100px;
          height: 100px;
          background: red;

          // Zeigt einen Text an
          Text {text: my_text;}

          TouchArea
          {
            // Reagiert auf einen Mausklick
            clicked => my_callback();
          }
        }
      }
      ```
    ],
    [
      #align(horizon + center, image("res/example_component_render_001.png"))
    ],
  ),
)


#figure(
  supplement: [Beispiel],
  caption: [Pseudo Rust-Code für einen Controller zu Beispiel 1],

  ```rust
    #[derive(Default)]
    struct Model
    {
      my_text: String,
    }

    struct Controller
    {
      model: Model,
      view_adapter: Weak<MyComponent>
    }

    impl Controller
    {
      pub fn new(comp: &MyComponent) -> Self
      {
        // register the callback
        comp.on_my_callback(|| println!("I was clicked"));

        Self
        {
          // Store a reference to the view
          view_adapter: comp.as_weak(),
          model: Model::default(),
        }
      }

      pub fn set_my_text(&mut self, text: String)
      {
        self.model.my_text = text;
        self.view_adapter
              .unwrap()
              .set_my_text(
                  self.model.my_text.to_shared_string()
              );
      }
    }

    fn main()
    {
      let view_adapter = MyComponent::new().unwrap();
      let mut controller = Controller::new(&view_adapter);

      controller.set_my_text(String::from("Bonjour"));

      view_adapter.run().unwrap();
    }
  ```,
)



= Bezug zum bisherigen Studium


= Fachliche und persönliche Erfahrungen
