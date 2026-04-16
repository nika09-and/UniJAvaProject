<#import "layout.ftlh" as layout>
<#import "spring.ftl" as spring>

<@layout.pageLayout title="Book List">
    <style>
        /* მარტივი დიზაინი წიგნების "ბადისთვის" (Grid) */
        .book-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
            padding: 20px 0;
        }

        .book-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            background: #fff;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s;
            display: flex;
            flex-direction: column;
        }

        .book-card:hover {
            transform: translateY(-5px);
        }

        .book-cover {
            width: 100%;
            height: 300px;
            object-fit: cover; /* სურათი რომ არ გაიწელოს */
            border-bottom: 1px solid #eee;
        }

        .book-info {
            padding: 15px;
            flex-grow: 1;
        }

        .book-title {
            font-size: 1.25rem;
            margin: 0 0 10px 0;
            color: #333;
        }

        .book-author {
            font-style: italic;
            color: #666;
            margin-bottom: 10px;
        }

        .book-category {
            display: inline-block;
            background: #e9ecef;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.85rem;
            margin-bottom: 10px;
        }

        .book-description {
            font-size: 0.9rem;
            color: #555;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* მაქსიმუმ 3 ხაზი გამოჩნდეს */
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
    </style>

    <h2>Book Explorer</h2>

    <#if books?has_content>
        <div class="book-grid">
            <#list books as book>
                <div class="book-card">
                    <#-- სურათის გამოძახება ID-ის მიხედვით [1] -->
                    <img src="<@spring.url '/books/' + book.id + '/image' />"
     alt="${book.title}"
     class="book-cover"
     onerror="this.src='<@spring.url '/images/no-cover.png' />'">
                    
                    <div class="book-info">
                        <div class="book-category">${book.category.name}</div>
                        <h3 class="book-title">${book.title}</h3>
                        <div class="book-author">by ${book.author}</div>
                        <p class="book-description">${book.description! "No description available."}</p>
                    </div>
                </div>
            </#list>
        </div>
    <#else>
        <div class="alert alert-info">No books have been added yet.</div>
    </#if>

    <div style="margin-top: 30px;">
        <a href="<@spring.url '/books/add'/>" class="btn btn-success">Add a new book</a>
    </div>
</@layout.pageLayout>