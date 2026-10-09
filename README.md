# Kannada Journey starter website

Seven static pages: Home, Programs, Who It's For (accessible tabs), How It Works, Everyday Kannada, About, Contact. No framework/build step. Works on GitHub Pages. Default copy is included in HTML so site works even if Supabase is unavailable; optional published text overrides load from site_content. The site launches under Kannada Journey alone, without an umbrella brand.

## Publish
1. Create a GitHub repository, upload the contents of the site folder at repository root, and enable Settings > Pages > Deploy from branch > main / root.
2. Custom domain: set it in Pages settings and set DNS with your registrar per GitHub's current instructions. Enable HTTPS after DNS resolves.
3. Run SUPABASE_SETUP.sql in Supabase SQL editor. Check existing tables/policies before rerunning. Dashboard users can add published rows such as home_intro, about_intro, everyday_intro with plain-text body. The frontend uses textContent, not HTML.
4. Copy your Supabase project URL and public anon key into assets/config.js. NEVER use a service_role/secret key there. Keep RLS enabled.
5. Test all links, mobile layout, tabs, database reads and form submissions. Configure CAPTCHA and rate limiting before public form launch; direct anonymous insert can be abused. No email notifications are set up by default.
6. Edit names, timing, offering descriptions, pricing, contact details, and outcomes to match your confirmed program before publishing. Several detailed names in previous drafts were reconstructed, not independently verified as final.

## Naming system
Marketing = front-door promise (Home hero, ads, tab introductions). Emotional = program card heading (learner's hoped-for transformation). Professional = curriculum descriptor (details for serious prospects/enrolled learners). These are not three separate courses. In the Who It's For page, tabs target healthcare, yoga, IT, and general beginners. No separate audience pages.

## Database fields
site_content: key, body, published; optional public text overrides. enquiries: name, email, phone, category, level, goal, mode, message, website (honeypot), created_at. Only admins should read enquiries in Supabase dashboard. Consider retention/consent requirements for your jurisdiction.

## Free-tier caveats
GitHub Pages hosts static files; Supabase serves data. Supabase free projects may pause after low activity; use a paid tier if guaranteed uptime matters. Scheduled keep-alives are not a contractual uptime guarantee, and provider plans may change. Domain registration/renewal is separate.