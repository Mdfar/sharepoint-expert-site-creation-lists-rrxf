Power Automate Logic: Order Approval Workflow
Trigger

Type: When an item is created (SharePoint List: SupplyOrders)

Actions

Initialize Variable: Store ManagerEmail based on ClinicLocation.

Start and Wait for an Approval:

Type: First to respond.

Title: New Supply Order from @{triggerOutputs()?['body/ClinicLocation']}.

Assigned To: @{variables('ManagerEmail')}.

Condition: If Outcome is equal to Approve.

Yes (Approved):

Update SharePoint Item: Set OrderStatus to Approved.

Send Email (V2): Notify requester with approval comments.

Post Message in Teams: Update the Admin channel.

No (Rejected):

Update SharePoint Item: Set OrderStatus to Rejected.

Send Email (V2): Notify requester with rejection reasons.

Reminders

Recurrence: Daily.

Action: Get items where OrderStatus eq 'Pending' and Created is older than 2 days.

Loop: Send reminder emails to managers.