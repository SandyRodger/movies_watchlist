<h1 class="p-6 bg-slate-100 rounded-xl shadow mb-4 text-xl font-semibold">
  Movies
</h1>

<div class="mb-4">
  <button
    data-controller="modal"
    data-action="click->modal#open"
    class="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded"
  >
    Add
  </button>
</div>

<table class="table-auto border-collapse border border-slate-400 w-full text-center">
  <thead class="bg-slate-100">
    <tr>
      <th class="border border-slate-400 px-4 py-2">Movie</th>
      <th class="border border-slate-400 px-4 py-2">Date Watched</th>
      <th class="border border-slate-400 px-4 py-2">Actions</th>
    </tr>
  </thead>
  <tbody>
    <% @movies.each do |movie| %>
      <tr class="hover:bg-slate-50">
        <td class="border border-slate-300 px-4 py-2"><%= movie.title %></td>
        <td class="border border-slate-300 px-4 py-2"><%= movie.watched_at %></td>
        <td class="border border-slate-300 px-4 py-2">
          <button class="bg-red-500 hover:bg-red-600 text-white font-semibold py-1 px-3 rounded shadow">
            Delete
          </button>
        </td>
      </tr>
    <% end %>
  </tbody>
</table>

<!-- Modal (hidden by default) -->
<div
  data-modal-target="backdrop"
  class="hidden fixed inset-0 z-40 bg-black/50"
  aria-hidden="true"
></div>

<div
  data-controller="modal"
  data-modal-target="panel"
  class="hidden fixed inset-0 z-50 flex items-center justify-center p-4"
  role="dialog"
  aria-modal="true"
  aria-labelledby="new-movie-title"
>
  <div class="w-full max-w-md rounded-xl bg-white shadow-xl">
    <div class="flex items-center justify-between px-4 py-3 border-b">
      <h2 id="new-movie-title" class="text-lg font-semibold">Add Movie</h2>
      <button data-action="click->modal#close" class="text-slate-500 hover:text-slate-700">✕</button>
    </div>

    <div class="p-4">
      <%= form_with model: Movie.new, url: movies_path, method: :post, local: true do |f| %>
        <div class="mb-3 text-left">
          <%= f.label :title, class: "block text-sm font-medium text-slate-700 mb-1" %>
          <%= f.text_field :title, class: "w-full rounded border-slate-300 focus:border-blue-500 focus:ring-blue-500" %>
        </div>

        <div class="mb-4 text-left">
          <%= f.label :watched_at, "Date watched", class: "block text-sm font-medium text-slate-700 mb-1" %>
          <%= f.datetime_local_field :watched_at, class: "w-full rounded border-slate-300 focus:border-blue-500 focus:ring-blue-500" %>
        </div>

        <div class="flex justify-end gap-2">
          <button type="button" data-action="click->modal#close"
                  class="px-4 py-2 rounded border border-slate-300 text-slate-700 hover:bg-slate-50">
            Cancel
          </button>
          <%= f.submit "Save",
                class: "px-4 py-2 rounded bg-blue-600 hover:bg-blue-700 text-white font-semibold" %>
        </div>
      <% end %>
    </div>
  </div>
</div>
