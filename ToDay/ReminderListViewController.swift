import UIKit

class ReminderListViewController: UITableViewController {
}

extension ReminderListViewController {
    static let reminderListCellIdentifier = "ReminderListCell"

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let renminder = Reminder.testData[indexPath.row]
        let image = renminder.isComplete ? UIImage(systemName: "cirle.fill") : UIImage(systemName: "cirle")
        cell.titleLabel.text = renminder.title
        cell.dateLabel.text = renminder.dueDate.description
        cell.doneButton.setBackgroundImage(image, for: .normal)
        cell.doneButtonAction = {
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }
}
