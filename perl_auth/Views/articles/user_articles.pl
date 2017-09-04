my $list ="
<table class='table table-hover table-striped'>
    <tr>
        <th>Title</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
";
foreach $arg(@data)
{
     $list.="<td>".$arg->{'title'}."</td>";
     $list.="<td ><form method='post' action='articles/edit'><input type='hidden' value='".$arg->{'id'}."' name='title_id'/>";
     $list.="<button class='btn btn-success'><span class='glyphicon glyphicon-wrench' aria-hidden='true'></span></button></td>";
     $list.="<td><a class='btn btn-success' href='articles/delete/".$arg->{'id'}."'><span class='glyphicon glyphicon-trash' aria-hidden='true'></span></a>";
     $list.= "</form></td></tr>";
}
$list .= "</table>";


$content = <<HTML;
    $list
HTML

return 1;