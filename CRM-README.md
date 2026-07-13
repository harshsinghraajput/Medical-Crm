# AI-First CRM — HCP Module (Log Interaction Screen)

## Architecture Overview

```
┌─────────────────────────────────────────────────────────┐
│                    REACT + REDUX FRONTEND                │
│  ┌─────────────────────┐  ┌──────────────────────────┐  │
│  │   INTERACTION FORM   │  │    AI CHAT ASSISTANT     │  │
│  │   (Left Panel)       │  │    (Right Panel)         │  │
│  │                      │  │                          │  │
│  │  Auto-populated by   │◄─│  Natural Language Input   │  │
│  │  AI tools            │  │  Tool calls → Form data  │  │
│  └─────────────────────┘  └──────────────────────────┘  │
└───────────────────────┬─────────────────────────────────┘
                        │ HTTP API
┌───────────────────────▼─────────────────────────────────┐
│                   FASTAPI BACKEND                        │
│  ┌──────────────────────────────────────────────────┐   │
│  │              LANGGRAPH AGENT                      │   │
│  │                                                   │   │
│  │  ┌─────────────────────────────────────────┐     │   │
│  │  │           5 AI TOOLS                     │     │   │
│  │  │                                          │     │   │
│  │  │  1. Log Interaction Tool (Required)      │     │   │
│  │  │  2. Edit Interaction Tool (Required)     │     │   │
│  │  │  3. Summarize Interaction Tool           │     │   │
│  │  │  4. Suggest Follow-up Tool               │     │   │
│  │  │  5. Search HCP Tool                      │     │   │
│  │  └─────────────────────────────────────────┘     │   │
│  └──────────────────────────────────────────────────┘   │
│                        │                                │
│  ┌─────────────────────▼──────────────────────────┐    │
│  │        GROQ LLM (gemma2-9b-it)                  │    │
│  └────────────────────────────────────────────────┘    │
│                        │                                │
│  ┌─────────────────────▼──────────────────────────┐    │
│  │     SQLite / PostgreSQL DATABASE                │    │
│  │     (Interactions, HCPs, Chat History)          │    │
│  └────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────┘
```

## Tech Stack
- **Frontend**: React 18, Redux 4, Google Inter font
- **Backend**: Python, FastAPI, LangGraph
- **LLM**: Groq (gemma2-9b-it model)
- **Database**: SQLite (easily switchable to PostgreSQL)

## The 5 AI Tools (LangGraph)

| # | Tool | Purpose |
|---|------|---------|
| 1 | `log_interaction_tool` | Extracts HCP info from natural language, populates form |
| 2 | `edit_interaction_tool` | Updates specific form fields while preserving other data |
| 3 | `summarize_interaction_tool` | Generates structured summary of the interaction |
| 4 | `suggest_followup_tool` | Recommends next steps based on sentiment & context |
| 5 | `search_hcp_tool` | Searches HCP database by name, specialty, or hospital |

## Setup Instructions

### 1. Backend Setup
```bash
cd crm-backend

# Create virtual environment
python -m venv venv
venv\Scripts\activate  # Windows
# source venv/bin/activate  # Mac/Linux

# Install dependencies
pip install -r requirements.txt

# Set your Groq API key in .env file
# GROQ_API_KEY=your_key_here

# Start the server
uvicorn app.main:app --reload --port 8000
```

### 2. Frontend Setup
Simply open `crm-frontend/index.html` in your browser.

Or use the batch scripts:
```bash
# Windows
start-backend.bat
start-frontend.bat
```

### 3. Get Groq API Key
1. Visit https://console.groq.com
2. Create an account
3. Generate an API key
4. Add it to `crm-backend/.env`

## Usage

1. Open the frontend in browser
2. Type your HCP interaction in the chat (right panel)
3. The AI automatically fills the form (left panel)
4. Use commands like:
   - "Met Dr. Smith at City Hospital, discussed new drug"
   - "Change sentiment to Positive"
   - "Summarize this interaction"
   - "Suggest follow-up actions"
   - "Search for cardiologists"

## API Endpoints
- `POST /api/chat` — Send message to AI agent
- `GET /api/form/current` — Get current form data
- `GET /api/form/history` — Get interaction history
- `POST /api/form/save` — Save interaction
- `GET /api/hcps` — List HCPs
- `GET /api/tools` — List AI tools
- `GET /api/health` — Health check
