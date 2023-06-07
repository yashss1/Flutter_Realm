# listy

A new Flutter project.

## Getting Started

3. Realm
    1. UI
    2. ADD CRUD operations
    3. Enable Synchronization with Atlas device sync
        1. Make class RealmModel()
        2. flutter pub run realm generate --watch. -> link model to realm
            1. Now run ->  on terminal to create online server
                1. atlas auth login -> cli login
                2. Atlas project list -> list all project
                3. Atlas project create “Listy”
                4. atlas config set project_id 6480bca1ba147a6ea0c3b706
                5. atlas config describe default
                6. Create cluster -> atlas cluster create listy-cluster --provider GCP --region WESTERN_EUROPE --tier M0
            2. Go to AppService on Atlas web
                1. Click - > Build your own app
                2. Go to device sync
                3. Select user can read and write all data
                4. Review and deploy
                5. Deploy
        3. Make sure you rerun the generator -> flutter pub run realm generate --watch
