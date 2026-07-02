use slint::{ToSharedString, Weak};

slint::slint!(
    export component MyComponent inherits Window
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
);


#[derive(Default)]
struct Model
{
    my_text: String,
}

struct Controller
{
    model: Model,
    view_adapter: Weak<MyComponent>,
}

impl Controller
{
    pub fn new(comp: &MyComponent) -> Self
    {
        // register the callback
        comp.on_my_callback(|| println!("I was clicked"));

        Self {
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
            .set_my_text(self.model.my_text.to_shared_string());
    }
}

fn main()
{
    let view_adapter = MyComponent::new().unwrap();
    let mut controller = Controller::new(&view_adapter);

    controller.set_my_text(String::from("Bonjour"));

    view_adapter.run().unwrap();
}
