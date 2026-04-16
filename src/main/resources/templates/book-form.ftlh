<#import "layout.ftlh" as layout>
<#import "spring.ftl" as spring>

<@layout.pageLayout title="Add Book">
    <h2>New Book</h2>

    <#-- წარმატების შეტყობინების ჩვენება -->
    <#if RequestParameters.success??>
        <div class="alert alert-success">Book added successfully.</div>
    </#if>

    <#-- სტანდარტული HTML ფორმა (enctype აუცილებელია ფაილის ატვირთვისთვის) [4, 5] -->
    <form action="/books/add" method="post" enctype="multipart/form-data">
        
        <div class="form-group">
            <label for="title">Title</label>
            <#-- სწორი სინტაქსი: @spring.formInput "ობიექტი.ველი" [1, 6] -->
            <@spring.formInput "bookForm.title" 'id="title" class="form-control"' />
            <@spring.showErrors "<br>" "text-danger" />
        </div>

        <div class="form-group">
            <label for="author">Author</label>
            <@spring.formInput "bookForm.author" 'id="author" class="form-control"' />
            <@spring.showErrors "<br>" "text-danger" />
        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <#-- Textarea-სთვის ვიყენებთ შესაბამის მაკროს [1] -->
            <@spring.formTextarea "bookForm.description" 'id="description" rows="5" class="form-control"' />
            <@spring.showErrors "<br>" "text-danger" />
        </div>

        <div class="form-group">
            <label for="categoryId">Category</label>
            <#-- ხელით აწყობილი select, რათა თავიდან ავიცილოთ ობიექტის სტრინგად გაგზავნა -->
            <select id="categoryId" name="categoryId" class="form-control">
                <option value="">-- Select category --</option>
                <#list categories as category>
                    <#-- ვიყენებთ ?c-ს, რომ ID გაიგზავნოს როგორც სუფთა რიცხვი (Long) [3] -->
                    <option value="${category.id?c}" 
                        <#if bookForm.categoryId?? && category.id == bookForm.categoryId>selected</#if>>
                        ${category.name}
                    </option>
                </#list>
            </select>
            <#-- ვაჩვენებთ შეცდომას, თუ კატეგორია არ არის არჩეული [7] -->
            <@spring.showErrors "<br>" "text-danger" />
        </div>

        <div class="form-group">
            <label for="coverImage">Cover Image</label>
            <#-- ფაილის ატვირთვის ინპუტი [5, 8] -->
            <input type="file" id="coverImage" name="coverImage" accept="image/*" class="form-control" />
        </div>

        <button type="submit" class="btn btn-primary">Save Book</button>
    </form>

    <p style="margin-top: 20px;"><a href="/books">View book list</a></p>
</@layout.pageLayout>