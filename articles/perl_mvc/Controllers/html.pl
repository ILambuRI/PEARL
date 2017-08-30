$txt = '';
#$txt = '<ul>';
    foreach (values %hash)
    {
        $txt .= '<p>Article ID:' . $_->{'id'} . ' | Login: ' . $_->{'login'} . '</p>';  
        $txt .= '<p>' . $_->{'title'} . '</p>';  
        $txt .= '<p>' . $_->{'txt'} . '</p>';
        $txt .= '<p>' . $_->{'date'} . '</p>';
    }
#$txt .= '</ul>';

$text2 =<<HTML;
    $txt
    1 2 3
HTML
1;
