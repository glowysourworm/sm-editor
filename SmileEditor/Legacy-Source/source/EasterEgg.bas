Attribute VB_Name = "EasterEgg"
Option Explicit

Private Type MetroidType
    SpeedH As Single
    SpeedV As Single
    Nearness As Single
End Type

Private Type BlockType
    Exists As Boolean
End Type

'Private MetroidTargetX As Single
'Private MetroidTargetY As Single
Private Metroid As MetroidType

Public MetroidMaxSpeed As Integer
Public MetroidMinSpeed As Integer
Public MetroidTargetX As Integer
Public MetroidTargetY As Integer
Public MetroidBehavior As Byte
Public Const MetroidAway = 0
Public Const MetroidMouse = 1
Public Const MetroidFeeding = 2
Public Const MetroidHunting = 3

Public MetroidFeedingIndex As Byte  'which index to feed on
Public MetroidFeedingTime As Integer   'how much longer to feed
Public MetroidFeedingTimeMax As Integer
'Public MetroidIdleTimer As Long  'how long since we've done anything in the level editor (assuming it's on top)
'Public MetroidIdleTimerMax As Integer


Public Sub MetroidTarget(X As Single, Y As Single, Optional MouseMoving As Boolean = True)
'set target location for metroid
Select Case MetroidBehavior
    Case MetroidAway: GoTo MetroidFlees
    Case MetroidMouse: GoTo MetroidApproaches
    Case MetroidFeeding: GoTo MetroidFeeds
    Case MetroidHunting: GoTo MetroidHunts
End Select

MetroidFlees:
MetroidTargetX = -100
MetroidTargetY = -100
Exit Sub

MetroidApproaches:
If MouseMoving = False Then Exit Sub
MetroidTargetX = Int(X)
MetroidTargetY = Int(Y)
Exit Sub

MetroidFeeds:
MetroidTargetX = Smile.EnemyBox(MetroidFeedingIndex).Left + (Smile.EnemyBox(MetroidFeedingIndex).Width \ 2)
MetroidTargetY = Smile.EnemyBox(MetroidFeedingIndex).Top
Exit Sub

MetroidHunts:
'if no longer eating, reset counter
If MetroidFeedingTime = 0 Then MetroidFeedingTime = MetroidFeedingTimeMax Else GoTo TargetMeal
'identify next victim
If UBound(EnemySet) > 0 Then
    Randomize Timer
    MetroidFeedingIndex = Int(Rnd * UBound(EnemySet)) + 1
Else
    If EnemySet(0).Species = 0 Then
        'no enemies in the room, so chase the mouse
        GoTo MetroidApproaches
    Else
        'only one enemy... feed, move away, feed, move away
        If MetroidFeedingIndex = 255 Then
            MetroidFeedingIndex = 0
        Else
            MetroidFeedingIndex = 255
            MetroidFindsRandomSpot
        End If
    End If
End If

'meal found, so chase it
TargetMeal:
If MetroidFeedingIndex < 255 Then
    MetroidTargetX = Smile.EnemyBox(MetroidFeedingIndex).Left + (Smile.EnemyBox(MetroidFeedingIndex).Width \ 2)
    MetroidTargetY = Smile.EnemyBox(MetroidFeedingIndex).Top
End If
End Sub

Private Sub MoveMetroid()
'need to move it?
If NeedToMoveMetroid = False Then
    If MetroidBehavior = MetroidFeeding Then
        MetroidFeedingTime = MetroidFeedingTime - 1
        If MetroidFeedingTime = 0 Then IdleMetroid
    End If
    If MetroidBehavior = MetroidHunting Then
        MetroidFeedingTime = MetroidFeedingTime - 1
        If MetroidFeedingTime < 0 Then MetroidFeedingTime = 0
    End If
    Exit Sub
End If

'account for horizontal movement
If MetroidMiddleX < MetroidTargetX Then
    If Metroid.SpeedH < MetroidMaxSpeed Then Metroid.SpeedH = Metroid.SpeedH + 0.2
    If Metroid.SpeedH < 0 Then Metroid.SpeedH = Metroid.SpeedH + 0.1
Else
    If Metroid.SpeedH > MetroidMinSpeed Then Metroid.SpeedH = Metroid.SpeedH - 0.2
    If Metroid.SpeedH > 0 Then Metroid.SpeedH = Metroid.SpeedH - 0.1
End If

'account for vertical movement
If MetroidMiddleY < MetroidTargetY Then
    If Metroid.SpeedV < MetroidMaxSpeed Then Metroid.SpeedV = Metroid.SpeedV + 0.2
    If Metroid.SpeedV < 0 Then Metroid.SpeedV = Metroid.SpeedV + 0.1
Else
    If Metroid.SpeedV > MetroidMinSpeed Then Metroid.SpeedV = Metroid.SpeedV - 0.2
    If Metroid.SpeedV > 0 Then Metroid.SpeedV = Metroid.SpeedV - 0.1
End If

Smile.MetroidImage1(0).Move Smile.MetroidImage1(0).Left + Metroid.SpeedH, Smile.MetroidImage1(0).Top + Metroid.SpeedV
Smile.MetroidImage1(1).Move Smile.MetroidImage1(0).Left, Smile.MetroidImage1(0).Top
Smile.MetroidImage1(2).Move Smile.MetroidImage1(0).Left, Smile.MetroidImage1(0).Top
Exit Sub


End Sub



Public Sub MetroidTimer()
Static TimerInterval As Integer

If TimerInterval = 0 Then Smile.MetroidImage1(0).Visible = True: Smile.MetroidImage1(1).Visible = False: Smile.MetroidImage1(2).Visible = False
If TimerInterval = 20 Then Smile.MetroidImage1(0).Visible = False: Smile.MetroidImage1(1).Visible = True: Smile.MetroidImage1(2).Visible = False
If TimerInterval = 40 Then Smile.MetroidImage1(0).Visible = False: Smile.MetroidImage1(1).Visible = False: Smile.MetroidImage1(2).Visible = True
If TimerInterval = 60 Then Smile.MetroidImage1(0).Visible = False: Smile.MetroidImage1(1).Visible = True: Smile.MetroidImage1(2).Visible = False
If TimerInterval = 80 Then TimerInterval = -1
TimerInterval = TimerInterval + 1
MetroidTarget 0, 0, False
MoveMetroid

'If MetroidIdleTimer > 0 Then MetroidIdleTimer = MetroidIdleTimer - 1
'If MetroidBehavior = MetroidAway And MetroidIdleTimer = 0 Then IdleMetroid

End Sub


Private Function MetroidMiddleX() As Integer
MetroidMiddleX = Smile.MetroidImage1(0).Left + (Smile.MetroidImage1(0).Width \ 2)
End Function

Private Function MetroidMiddleY() As Integer
MetroidMiddleY = Smile.MetroidImage1(0).Top + (Smile.MetroidImage1(0).Height \ 2)
End Function

Private Function NeedToMoveMetroid() As Boolean
CheckPositionOfMetroid:
If MetroidMiddleX <> MetroidTargetX Or MetroidMiddleY <> MetroidTargetY Then NeedToMoveMetroid = True
End Function

Public Sub IdleMetroid()
MetroidBehavior = MetroidMouse
MetroidTarget Smile.Target(1).Left, Smile.Target(1).Top, True
'MetroidIdleTimer = MetroidIdleTimerMax
End Sub


Private Sub MetroidFindsRandomSpot()
Randomize Timer
MetroidFeedingIndex = 255
MetroidTargetX = Int(Rnd * Smile.Picture2.Width)
MetroidTargetY = Int(Rnd * Smile.Picture2.Height)
End Sub
