pip install kivy

from kivy.app import App
from kivy.uix.boxlayout import BoxLayout
from kivy.uix.button import Button
from kivy.uix.textinput import TextInput

class CalculatorApp(App):

    def build(self):
        self.operators = ['+', '-', '*', '/']
        self.last_was_operator = None
        self.result = TextInput(font_size=32, readonly=True, halign='right', multiline=False)
        layout = BoxLayout(orientation='vertical')
        layout.add_widget(self.result)
        buttons = [
            ['7', '8', '9', '/'],
            ['4', '5', '6', '*'],
            ['1', '2', '3', '-'],
            ['.', '0', 'C', '+']
        ]
        for row in buttons:
            h_layout = BoxLayout()
            for label in row:
                button = Button(text=label, pos_hint={'center_x': 0.5, 'center_y': 0.5})
                button.bind(on_press=self.on_button_press)
                h_layout.add_widget(button)
            layout.add_widget(h_layout)

        equals = Button(text='=', pos_hint={'center_x': 0.5, 'center_y': 0.5})
        equals.bind(on_press=self.on_solution)
        layout.add_widget(equals)

        return layout

    def on_button_press(self, instance):
        current = self.result.text
        button_text = instance.text

        if button_text == 'C':
            # Clear the input field
            self.result.text = ''
        else:
            if current and (self.last_was_operator and button_text in self.operators):
                # Don't add two operators right after each other
                return
            elif current == '' and button_text in self.operators:
                # First character cannot be an operator
                return
            else:
                new_text = current + button_text
                self.result.text = new_text
        self.last_was_operator = button_text in self.operators

    def on_solution(self, instance):
        text = self.result.text
        try:
            solution = str(eval(self.result.text))
            self.result.text = solution
        except Exception:
            self.result.text = 'Error'
        self.last_was_operator = False

if __name__ == '__main__':
    app = CalculatorApp()
    app.run()
