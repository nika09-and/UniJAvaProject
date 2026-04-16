<#macro pageLayout title>
<!DOCTYPE html>
<html lang="ka">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<header>
    <div class="site-header">
        <img src="/images/logo.png" alt="Logo" class="logo" />
        <div>
            <h1>Book Manager</h1>
            <p>Manage books and categories with FreeMarker forms</p>
        </div>
    </div>
</header>
<main>
    <#nested />
</main>
<footer>
    <p>Book Manager &copy; 2026</p>
</footer>
</body>
</html>
</#macro>
