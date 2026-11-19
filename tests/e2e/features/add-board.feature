Feature: Add Board from side menu
  As a user
  I want to be able to create new boards in an existing project
  So that I can organize the tasks of a project on multiple boards

  # Besides from the side menu, it is also possible to create a board from the projects page (if there are no boards yet for this project).
  # This is a separate feature and not handled in this feature file.

  Background:
    Given the user has logged in
    And the user opened the form to add a board from the side menu

  Scenario: submit form with missing name
    When the user submits the form with name ""
    Then the missing fields should be highlighted

  Scenario: submit valid form with template
    When the user submits the form with name "Invite team members", project "Getting started" and template "<template>"
    Then a board with name "Invite team members" should be created with template "<template>" in project "Getting started"
    And the created board should contain the lists "<lists>"
    And the created board should be displayed

    Examples:
      | template | lists |
      | Kanban | Open,Todo,In Progress,To Test,Done |
      | Marketing Campaign | Open,Planned,Creating,Review,Scheduled,Published |
      | Personal | Open,Planned,Today,This Week,Done |
      | Simple | Open,Todo,In Progress,Done |
      | Software Development | Open,Todo,In Progress, Code Review,Testing,Done |

  Scenario: import board
    When the user selects to import a board from <provider>
    Then a file upload dialog should be displayed that allows files with extension "<file_extension>"

    Examples:
      | provider | file_extension |
      | 4ga Boards | .tgz |
      | Trello | .json |
