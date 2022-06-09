#include <gtk/gtk.h>
#include <cairo.h>

#define GIVEN_COLOR 0, 0, 0
#define SOLVED_COLOR 0, 0, 1

#define DEF_BOX_SIZE 50
#define DEF_FONT_SIZE_Q 20

struct tuple_t {
    int i, j;
};

typedef struct {
    int i, j;
    int element;
    int n_available;
    int *available;
    int is_given;
} cell_t;

struct solve_arg_t {
    cell_t *cell;
    int e_start;
    struct tuple_t *removed;
    int n_removed;
};

int n, n2, empty_cells, stack_idx, FPS;
gdouble x_diff, y_diff;
cell_t *grid_;
struct solve_arg_t *stack;
gboolean will_tick, tick_once;

void print_mem_error(int n, size_t size) {
    fprintf(stderr, "Memory allocation error! size = %d * %zu\n", n, size);
    exit(EXIT_FAILURE);
}

guint min(guint a, guint b) {
    return a < b ? a : b;
}

cell_t *grid(int i, int j) {
    return &grid_[i*n2 + j];
}

int element(int i, int j) {
    return (*grid(i, j)).element;
}

int *available(int i, int j) {
    return (*grid(i, j)).available;
}

int is_given(int i , int j) {
    return (*grid(i, j)).is_given;
}

void initialize_grid() {
    empty_cells = n2*n2;
    grid_ = malloc(n2*n2 * sizeof(cell_t));
    if (grid_ == NULL)
        print_mem_error(n2*n2, sizeof(cell_t));

    for (int q = 0; q < n2*n2; q++) {
        grid_[q].i = q / n2;
        grid_[q].j = q % n2;
        grid_[q].element = 0;
        grid_[q].n_available = n2;
        grid_[q].available = malloc(n2 * sizeof(int));
        grid_[q].is_given = 0;
        if (grid_[q].available == NULL)
            print_mem_error(n2, sizeof(int));
        for (int j = 0; j < n2; j++)
            grid_[q].available[j] = 1;
    }
}

int remove_from_availables(int e, int a, int b, struct tuple_t *removed_arr, int *n_removed) {
    cell_t *c = grid(a, b);

    if (!c->available[e-1])
        return 0;

    c->available[e-1] = 0;
    c->n_available--;

    if (removed_arr != NULL && n_removed != NULL) {
        removed_arr[*n_removed].i = a;
        removed_arr[*n_removed].j = b;
        (*n_removed)++;
    }

    return 1;
}

int place(int e, int a, int b, int is_given, struct tuple_t *removed_arr, int *n_removed) {
    if (e < 1 || e > n2)
        return 0;

    if (!available(a, b)[e-1])
        return 0;

    grid(a, b)->element = e;
    grid(a, b)->is_given = is_given;
    empty_cells--;

    if (n_removed != NULL)
        *n_removed = 0;

    // Remove e from availables from the same ...

    // row
    for (int c = 0; c < n2; c++)
        remove_from_availables(e, a, c, removed_arr, n_removed);

    // column
    for (int r = 0; r < n2; r++) {
        remove_from_availables(e, r, b, removed_arr, n_removed);
    }

    // box
    for (int r = (a/n) * n; r < (a/n+1) * n; r++)
        for (int c = (b/n) * n; c < (b/n+1) * n; c++)
            remove_from_availables(e, r, c, removed_arr, n_removed);

    return 1;
}

void remove_element(cell_t *cell, struct tuple_t *removed, int n_removed) {
    for (int q = 0; q < n_removed; q++) {
        cell_t *c = grid(removed[q].i, removed[q].j);
        c->available[(cell->element) - 1] = 1;
        c->n_available++;
    }

    cell->element = 0;
    empty_cells++;
}

void read_file(const char *fname) {
    FILE *fpin;
    int e;

    fpin = fopen(fname, "r");
    if (fpin == NULL) {
        fprintf(stderr, "Input file not found!\n");
        exit(EXIT_FAILURE);
    }

    fscanf(fpin, "%d", &n);
    n2 = n*n;

    initialize_grid();

    for (int q = 0; q < n2; q++)
        for (int w = 0; w < n2; w++) {
            fscanf(fpin, "%d", &e);
            place(e, q, w, 1, NULL, NULL);
        }

    fclose(fpin);

    printf("Read\n");
}

// Create a sorted list of coordinates of the grid according to available_n
void sort() {
    int n_stack;
    cell_t *c, *tmp;

    n_stack = stack_idx;

    // Insertion sort
    for (int q = 0; q < n2*n2; q++) {
        c = &grid_[q];
        if (c->element > 0)
            continue;
        stack[n_stack].cell = c;
        stack[n_stack].e_start = 1;
        stack[n_stack].n_removed = 0;
        for (int w = n_stack-1; w >= stack_idx && c->n_available < stack[w].cell->n_available; w--) {
            tmp = stack[w].cell;
            stack[w].cell = c;
            stack[w+1].cell = tmp;
        }
        n_stack++;
    }
}

int solve_r(cell_t *cell, int e_start, struct tuple_t *removed, int *n_removed) {
    int e;

    if (empty_cells == 0)
        return 1;

    for (e = e_start; e <= n2 && !cell->available[e-1]; e++);

    // Backtrack
    if (e > n2) {
        stack_idx--;
        return 0;
    }

    // Continue
    place(e, cell->i, cell->j, 0, removed, n_removed);
    stack_idx++;
    stack[stack_idx].e_start = 1;

    return 1;
}

static gboolean tick(gpointer darea) {
    struct solve_arg_t *args;
    int is_valid;

    if (will_tick || tick_once) {
        args = stack + stack_idx;
        is_valid = solve_r(args->cell, args->e_start, args->removed, &(args->n_removed));
        if (is_valid)
            sort();
        else {
            stack[stack_idx].e_start = ((stack[stack_idx].cell)->element) + 1;
            remove_element(stack[stack_idx].cell, stack[stack_idx].removed, stack[stack_idx].n_removed);
        }
        tick_once = FALSE;
    }

    gtk_widget_queue_draw(GTK_WIDGET(darea));

    return empty_cells > 0;
}

void init_solve() {
    stack_idx = 0;

    stack = malloc(n2*n2 * sizeof(struct solve_arg_t));
    if (stack == NULL)
        print_mem_error(n2*n2, sizeof(struct solve_arg_t));

    for (int i = 0; i < n2*n2; i++)
        stack[i].removed = malloc(3 * n2 * sizeof(struct tuple_t));

    sort();
}

static void print_grid(cairo_t *cr, gdouble font_size) {
    char snum[4];
    cairo_text_extents_t te;

    cairo_set_font_size(cr, font_size);

    for (int i = 0; i < n2; i++) {
        for (int j = 0; j < n2; j++) {
            double cx, cy;

            if (element(i, j) < 1)
                continue;

            sprintf(snum, "%d", element(i, j));
            cairo_text_extents(cr, snum, &te);

            cx = x_diff * (j + 0.5) - te.x_bearing - te.width / 2;
            cy = y_diff * (i + 0.5) - te.y_bearing - te.height / 2;

            if (is_given(i, j))
                cairo_set_source_rgb(cr, GIVEN_COLOR);
            else
                cairo_set_source_rgb(cr, SOLVED_COLOR);

            cairo_move_to(cr, cx, cy);
            cairo_show_text(cr, snum);
        }
    }
}

static void draw_grid(cairo_t *cr, guint width, guint height) {
    cairo_set_line_width(cr, 1);

    // Horizontal lines
    for (int i = 1; i < n2; i++) {
        if (i % n == 0)
            continue;
        cairo_move_to(cr, 0, i*y_diff);
        cairo_line_to(cr, width, i*y_diff);
    }

    // Vertical lines
    for (int i = 1; i < n2; i++) {
        if (i % n == 0)
            continue;
        cairo_move_to(cr, i*x_diff, 0);
        cairo_line_to(cr, i*x_diff, height);
    }

    cairo_stroke(cr);

    // Draw the box lines thicker
    cairo_set_line_width(cr, 3);

    // Horizontal box lines
    for (int i = n; i < n2; i+=n) {
        cairo_move_to(cr, 0, i*y_diff);
        cairo_line_to(cr, width, i*y_diff);
    }

    // Vertical box lines
    for (int i = n; i < n2; i+=n) {
        cairo_move_to(cr, i*x_diff, 0);
        cairo_line_to(cr, i*x_diff, height);
    }

    cairo_stroke(cr);
}

static gboolean draw(GtkWidget *darea, cairo_t *cr, gpointer data) {
    guint width, height;

    width = gtk_widget_get_allocated_width(darea);
    height = gtk_widget_get_allocated_height(darea);

    x_diff = (gdouble) width / n2;
    y_diff = (gdouble) height / n2;

    draw_grid(cr, width, height);
    print_grid(cr, (gdouble) min(width, height) / DEF_FONT_SIZE_Q / (n-2));

    return FALSE;
}

static void on_key_press(GtkWidget *widget, GdkEventKey *event, gpointer data) {
    if (event->keyval == GDK_KEY_space)
        will_tick = !will_tick;
    else if (event->keyval == GDK_KEY_Right && !will_tick)
        tick_once = TRUE;
}

static gboolean on_click(GtkWidget *widget, GdkEventButton *event, gpointer user_data) {
    int i, j;

    j = event->x / x_diff;
    i = event->y / y_diff;

    g_print("grid[%d][%d]\telement: %d\tavailable_n: %d\tavailables: ", i, j, element(i, j), grid(i, j)->n_available);

    for (int e = 1; e <= n2; e++)
        if (available(i, j)[e-1])
            g_print("%d ", e);

    g_print("\n");

    return TRUE;
}

static void activate(GtkApplication *app, gpointer user_data) {
    GtkWidget *window, *darea;

    // Set up the main window
    window = gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), "Sudoku Solver");
    gtk_window_set_default_size(GTK_WINDOW(window), n2*DEF_BOX_SIZE, n2*DEF_BOX_SIZE);

    // Set up the drawing area
    darea = gtk_drawing_area_new();
    gtk_container_add(GTK_CONTAINER(window), darea);
    g_signal_connect(G_OBJECT(darea), "draw", G_CALLBACK(draw), NULL);

    // Listen for mouse click events
    gtk_widget_add_events(window, GDK_BUTTON_RELEASE_MASK);
    g_signal_connect(G_OBJECT(window), "button-release-event", G_CALLBACK(on_click), NULL);

    // Listen for keyboard events
    gtk_widget_add_events(window, GDK_KEY_RELEASE_MASK);
    g_signal_connect(G_OBJECT(window), "key_release_event", G_CALLBACK(on_key_press), NULL);

    gtk_widget_show_all(window);

    will_tick = FALSE;
    tick_once = FALSE;
    g_timeout_add(1000/FPS, tick, darea);

    // Solve
    init_solve();
}

int main(int argc, char **argv) {
    GtkApplication *app;
    int status;

    read_file("../sudoku4.txt");

    FPS = n*n2;

    app = gtk_application_new(NULL, G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, "activate", G_CALLBACK(activate), NULL);
    status = g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    return status;
}