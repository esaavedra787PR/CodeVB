Imports System.Data.SqlClient

Public Class Form1
    ' Use "Computer\SQLEXPRESS" as the Data Source
    ' Use "i" as the Initial Catalog
    ' Use Integrated Security if you are using Windows Authentication
    Dim connectionString As String = "Data Source=Computer\SQLEXPRESS;Initial Catalog=iTrans;Integrated Security=True"

    Private Sub btnlogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim username As String = txtusername.Text
        Dim password As String = txtpassword.Text

        Using connection As New SqlConnection(connectionString)
            connection.Open()

            ' Change the table and column names based on your actual database schema
            Dim query As String = "SELECT COUNT(*) FROM tblSecUsers WHERE ID = @username AND Password = @password"
            Using command As New SqlCommand(query, connection)
                command.Parameters.AddWithValue("@username", username)
                command.Parameters.AddWithValue("@password", password)

                Dim result As Integer = Convert.ToInt32(command.ExecuteScalar())

                If result > 0 Then
                    MessageBox.Show("Login successful!")
                    Me.Hide()
                    Form2.Show()
                    ' Add code to open the next form or perform further actions.
                Else
                    MessageBox.Show("Invalid login credentials. Please try again.")
                End If
            End Using
        End Using
    End Sub
End Class


