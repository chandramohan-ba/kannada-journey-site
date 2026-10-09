create table if not exists public.site_content (key text primary key, body text not null, published boolean not null default false, updated_at timestamptz not null default now());
create table if not exists public.enquiries (id bigint generated always as identity primary key, name text not null, email text not null, phone text, category text not null, level text not null, goal text, mode text, message text, website text, created_at timestamptz not null default now());
alter table public.site_content enable row level security;
alter table public.enquiries enable row level security;
create policy "Read published content" on public.site_content for select to anon using (published = true);
create policy "Submit enquiry" on public.enquiries for insert to anon with check (char_length(name) between 1 and 120 and char_length(email) between 3 and 254 and email ~ '^[^@ ]+@[^@ ]+\.[^@ ]+$' and coalesce(website,'') = '' and char_length(coalesce(message,'')) <= 4000);
-- No anonymous select/update/delete policies: only admins via authenticated backend/dashboard manage these tables.
-- Recommended for production: CAPTCHA + rate-limited Edge Function instead of direct anonymous INSERT.